# frozen_string_literal: true

DeviceConfiguration = Struct.new(:name, :certificate_pem, :private_key, :public_key, :root_ca)
