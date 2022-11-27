# frozen_string_literal: true

require 'faraday'
require 'faraday/net_http'

class SendConfigurationToDevice
  def initialize(device_endpoint, configuration)
    @client = Faraday.new(device_endpoint) do |faraday|
      faraday.adapter :net_http
    end
    @configuration = configuration
  end

  def run
    @client.post('/', @configuration)
  end
end
