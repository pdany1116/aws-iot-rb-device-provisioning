# frozen_string_literal: true

require 'aws-sdk-iot'

class CreateProvisioningClaim
  def initialize(template_name)
    @client = Aws::IoT::Client.new(
      region: ENV['AWS_REGION'],
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    )
    @template_name = template_name
  end

  def run
    @client.create_provisioning_claim(template_name: @template_name)
  end
end
