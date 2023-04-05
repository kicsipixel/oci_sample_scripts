#!/usr/bin/ruby
# frozen_string_literal: true

# This script demonstrates how to list all the users in a given compartment
# Created by Szabolcs Toth, 01-04-2023
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on Windows "C:\Users\{user}\.oci\config").
#
# Format:
#   list_users_compartment.rb compartment_id
#
# Example run:
#   ruby list_users_compartment.rb ocid1.compartment.oc1..aaaaaaaachbptfsq3er27xguzvnc27l2cthlhc2ru2p4jcafdm4zuzdmgw2q

require 'oci'

compartment_id = ARGV[0]

identity_client = OCI::Identity::IdentityClient.new(region: OCI::Regions::REGION_EU_FRANKFURT_1)
# Get compartment id from user input
response = identity_client.list_users(compartment_id)
response.data.each { |user| puts user.name }
