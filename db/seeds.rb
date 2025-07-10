# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
org1 = Organization.create(name: "Alpha Corp", description: "First Org")
org2 = Organization.create(name: "Beta Ltd", description: "Second Org")

user1 = User.create(email: "admin@alpha.com", password: "password")
user2 = User.create(email: "member@beta.com", password: "password")

Membership.create(user: user1, organization: org1, role: 'admin')
Membership.create(user: user2, organization: org2, role: 'member')


user = User.create!(email: "test@example.com", password: "password")
org3 = Organization.create!(name: "Acme Inc")
org4 = Organization.create!(name: "PearlThoughts")

Membership.create!(user: user, organization: org3, role: "admin")
Membership.create!(user: user, organization: org4, role: "member")
