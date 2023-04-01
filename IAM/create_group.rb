#!/usr/bin/ruby

# This script demonstrates how to create a group in the tenancy 
# Created by Szabolcs Toth, 01-04-2023
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on Windows "C:\Users\{user}\.oci\config").
#
# Format:
#   create_group.rb group_name group_description
#
# Example run:
#   ruby create_group.rb "test_group" "test group created by SDK"

require 'oci'

group_name = ARGV[0]
group_description = ARGV[1]

identity_client = OCI::Identity::IdentityClient.new(region: OCI::Regions::REGION_EU_FRANKFURT_1)
# Get tetancy id automatically 
compartment_id = identity_client.get_compartment(OCI.config.tenancy).data.id

create_group_response =
  identity_client.create_group(
    OCI::Identity::Models::CreateGroupDetails.new(
      compartment_id: compartment_id,
      name: group_name,
      description: group_description,
    )
  )

# Get the data from response
puts "#{create_group_response.data}"