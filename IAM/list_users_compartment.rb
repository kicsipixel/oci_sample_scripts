#!/usr/bin/ruby

# This script demonstrates how to list all the users in a given compartment 
# Created by Szabolcs Toth, 01-04-2023
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on Windows "C:\Users\{user}\.oci\config").
#
# Format:
#   list.user.rb compartment_id
#
# Example run:
#   ruby list.user.rb ocid1.compartment.oc1..aaaaaaaachbptfsq3er27xguzvnc27l2cthlhc2ru2p4jcafdm4zuzdmgw2q

require 'oci'

compartment_id = ARGV[0]

api = OCI::Identity::IdentityClient.new(region: OCI::Regions::REGION_EU_FRANKFURT_1)
# get compartment id from user input
response = api.list_users(compartment_id)
response.data.each { |user| puts user.name }