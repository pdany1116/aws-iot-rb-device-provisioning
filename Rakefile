# frozen_string_literal: true

require 'rake'
require 'dotenv'
require './lib/create_provisioning_claim'
require './lib/device_configuration'
require './lib/send_configuration_to_device'

Dotenv.load('.env')

task :default do
  aws_response = CreateProvisioningClaim.new(ENV['AWS_TEMPLATE_NAME']).run

  print 'Please connect to device WiFi AP and press ENTER to continue...'
  gets

  device_configuration = DeviceConfiguration.new(
    ENV['DEVICE_NAME'],
    aws_response.certificate_pem,
    aws_response.key_pair.private_key,
    aws_response.key_pair.public_key,
    ENV['AWS_ROOT_CA']
  )

  device_response = SendConfigurationToDevice.new(ENV['DEVICE_ENDPOINT'], device_configuration).run

  pp device_response
end
