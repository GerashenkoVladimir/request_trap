class Request <ApplicationRecord
  belongs_to :trap

  def query_params_to_hash
    eval(query_params)
  end

  def cookies_to_hash
    eval(cookies)
  end

  def headers_to_hash
    eval(headers)
  end
end