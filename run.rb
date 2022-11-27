#!/usr/bin/env ruby

require 'dotenv'
Dotenv.load('.env')

require './lib/create_provisioning_claim'
require './lib/device_configuration'
require './lib/send_configuration_to_device'

aws_response = CreateProvisioningClaim.new(ENV['AWS_TEMPLATE_NAME']).run

device_configuration = DeviceConfiguration.new(
  ENV['DEVICE_NAME'],
  aws_response.certificate_pem,
  aws_response.key_pair.private_key,
  aws_response.key_pair.public_key,
  ENV['AWS_ROOT_CA']
)

device_response = SendConfigurationToDevice.new(ENV['DEVICE_ENDPOINT'], device_configuration).run

exit 0
