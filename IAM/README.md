# Identity and Access Management scripts

Notice that IAM resources (users, groups, compartments, and some policies) reside within the tenancy itself, unlike cloud resources such as compute instances, which typically reside within compartments inside the tenancy.

- [create_group.rb](create_group.rb) - Create a group in the tenancy with name and description
- [create_user.rb](create_user.rb) - Create a user in the tenancy with name, descritpion and e-mail address
- [list_groups.rb](list_groups.rb) - List all groups in the tenancy
- [list_users.rb](list_users.rb) - List all users in the tenancy
- [list_users_compartment.rb](list_users.rb) - List all users in a given comparment (compartment_id required)