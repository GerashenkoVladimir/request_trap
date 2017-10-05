class TrapController < ApplicationController
  def index
  end
  def catch_request
    @trap = Trap.find_by(name: params[:trap_id])
    @trap = Trap.new(name: params[:trap_id]) unless @trap
    @trap.save
    header_keys = request.headers.env.keys.select do |header_name|
      header_name.match("^HTTP|^REQUEST|^SERVER|^QUERY|PATH")
    end
    header_list = {}
    header_keys.each {|key| header_list[key] = request.headers[key]}
    @new_request = @trap.requests.create(
        remote_ip: request.remote_ip,
        request_method: request.method,
        scheme: request.scheme,
        query_string: request.fullpath,
        query_params: request.query_parameters,
        cookies: request.cookies,
        headers: header_list
    )
    ActionCable.server.broadcast 'trap',
                                 created_at: @new_request.created_at,
                                 query_string: @new_request.query_string,
                                 remote_ip: @new_request.remote_ip,
                                 request_method: @new_request.request_method,
                                 scheme: @new_request.scheme,
                                 query_params: @new_request.query_params_to_hash.to_json,
                                 cookies: @new_request.cookies_to_hash.to_json,
                                 headers: @new_request.headers_to_hash.to_json
    head :ok
  end
  def request_list
    @trap = Trap.find_by(name: params[:trap_id])
  end
end