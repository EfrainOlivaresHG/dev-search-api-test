require 'uri'
require 'net/http'

# Reuse get, post functions to keep tests DRY
#
module Helpers
  @port = '9000'
  @ip = '192.168.99.100'

  def self.get(route)
    uri = URI.parse("http://#{@ip}:#{@port}")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(route, 'Content-Type' => 'application/json')
    http.request(request)
  end
end
