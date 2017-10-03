class TrapController < ApplicationController
  def index
  end
  def catch_request
    @trap = Trap.find_by(name: params[:trap_id])
    @trap = Trap.new(name: params[:trap_id]) unless @trap
    @trap.save
    p request.headers
    @trap.requests.create(
        remote_ip: request.remote_ip,
        request_method: request.method,
        scheme: request.scheme,
        query_string: request.fullpath,
        query_params: request.query_parameters,
        cookies: request.cookies,
        headers: request.headers.hash
    )
    @trap
  end
  def request_list
  end
end