#!/usr/bin/ruby

# This script demonstrates how to add a user to a group
# Created by Szabolcs Toth, 01-04-2023
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on Windows "C:\Users\{user}\.oci\config").
#
# Format:
#   add_user_to_group_noid.rb
#
# Example run:
#   ruby add_user_to_group_noid.rb
#
# Pick the user and the group from the list.

require 'oci'

identity_client = OCI::Identity::IdentityClient.new(region: OCI::Regions::REGION_EU_FRANKFURT_1)
users_list = []
groups_list = []
selected_user = nil
selected_group = nil

# Get the list of users
response = identity_client.list_users(OCI.config.tenancy)
response.data.each { |user| users_list.push(user)}

# Get the list of groups
response = identity_client.list_groups(OCI.config.tenancy)
response.data.each { |group| groups_list.push(group)}

# Show the list of users
puts "\n*** USERS *** "
users_list.each.with_index(1) do |option, index|
  puts "#{index}. #{option.name}"
end
puts "******"

loop do
  print "Pick a user from the list > "
  choice = gets.to_i
  selected_user= users_list[choice - 1]
  break if choice.between?(1, users_list.size)

  puts "Enter a value between 1 and #{users_list.size}"
end

# Show the list of groups
puts "\n*** GROUPS *** "
groups_list.each.with_index(1) do |option, index|
  puts "#{index}. #{option.name}"
end
puts "******"

loop do
  print "Pick a group from the list > "
  choice = gets.to_i
  selected_group = groups_list[choice - 1]
  break if choice.between?(1, groups_list.size)

  puts "Enter a value between 1 and #{groups_list.size}"
end

puts "\nAdding user: #{selected_user.name} to group: #{selected_group.name}..."

add_user_to_group_response =
  identity_client.add_user_to_group(
    OCI::Identity::Models::AddUserToGroupDetails.new(
      user_id: selected_user.id,
      group_id: selected_group.id
    )
  )

# Get the data from response
puts "\n#{add_user_to_group_response.data}"