#!/usr/bin/ruby
# frozen_string_literal: true

# This script demonstrates how to create a user in the tenancy
# Created by Szabolcs Toth, 01-04-2023
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on Windows "C:\Users\{user}\.oci\config").
#
# Format:
#   create_user.rb user_name user_description user_email
#
# Example run:
#   ruby create_user.rb "test" "test user created by SDK" test@test.com

require 'oci'

user_name = ARGV[0]
user_description = ARGV[1]
user_email = ARGV[2]

identity_client = OCI::Identity::IdentityClient.new(region: OCI::Regions::REGION_EU_FRANKFURT_1)
# Get tetancy id automatically
compartment_id = identity_client.get_compartment(OCI.config.tenancy).data.id

create_user_response =
  identity_client.create_user(
    OCI::Identity::Models::CreateUserDetails.new(
      compartment_id:,
      name: user_name,
      description: user_description,
      email: user_email
    )
  )

# Get the data from response
puts create_user_response.data.to_s
