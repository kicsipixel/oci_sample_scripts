#!/usr/bin/ruby
# frozen_string_literal: true

# This script demonstrates how to add a user to a group
# Created by Szabolcs Toth, 01-04-2023
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on Windows "C:\Users\{user}\.oci\config").
#
# Format:
#   add_user_to_group.rb user_id group_id
#
# Example run:
#   ruby add_user_to_group.rb ocid1.user.oc1..aaaaaaaaeyt6rin5vnjlpkk3lmzt2e36wmcf4qg4z3rbmzwrnvziswymio3a ocid1.group.oc1..aaaaaaaa4bwjqlluqvttiyphzr344dxa6hls45jbyfocj3yl67cznsjjhqsa

require 'oci'

user_id = ARGV[0]
groud_id = ARGV[1]

identity_client = OCI::Identity::IdentityClient.new(region: OCI::Regions::REGION_EU_FRANKFURT_1)

add_user_to_group_response = identity_client.add_user_to_group(OCI::Identity::Models::AddUserToGroupDetails.new(user_id: user_id, group_id: groud_id))

# Get the data from response
puts add_user_to_group_response.data.to_s
