require "http/client"
require "json"

class Buxfer
  def initialize(user_name : String, password : String)
    @token = auth_call(user_name, password)[:response][:token]
  end

  private def http
    @http ||= HTTP::Client.new("www.buxfer.com", nil, true)
  end

  private def token(user_name, password)
  	call("GET", "/api/login?userid=#{user_name}&password=#{password}")
  end

  private def api_call(url, params)
  end

  private def call(method, url, body)
  	case method
  	when "GET":
  		http.get(url)
  	end
  end
end
