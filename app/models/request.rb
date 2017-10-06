# == Schema Information
#
# Table name: requests
#
#  id             :integer          not null, primary key
#  created_at     :datetime
#  remote_ip      :string
#  request_method :string
#  scheme         :string
#  query_string   :string
#  query_params   :string
#  cookies        :string
#  headers        :string
#  trap_id        :integer
#

class Request <ApplicationRecord
  belongs_to :trap
  validates :remote_ip, :request_method, :scheme, :query_string, :trap, presence: true

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
