# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

User.destroy_all


user = User.create( email: 'tv@test.fr',
                    password: 'azerty',
                    password_confirmation: 'azerty')

puts "Creating #{User.all.size} users"

