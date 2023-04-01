#!/usr/bin/ruby

# This script demonstrates how to list all the users in your tenancy. 
# Created by Szabolcs Toth, 01-04-2023
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on Windows "C:\Users\{user}\.oci\config").
#
# Format:
#   list.user.rb
#
# Example run:
#   ruby list.user.rb

require 'oci'

api = OCI::Identity::IdentityClient.new(region: OCI::Regions::REGION_EU_FRANKFURT_1)
# get tenancy id from your config file
response = api.list_users(OCI.config.tenancy)
response.data.each { |user| puts user.name }