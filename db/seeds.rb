# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

Request.destroy_all
User.destroy_all
Workstation.destroy_all

user = User.create( email: 'tv@test.fr',
                    password: 'azerty',
                    password_confirmation: 'azerty',
                    name: 'Thibault',
                    phone_number: '07 01 01 01 01',
                    biography: 'Après 7 ans de supply chain, je me mets au code !')

user_unconfirmed = User.create( email: 'uuc@test.fr',
                    password: 'azerty',
                    name: 'user unconfirmed',
                    phone_number: '07 01 01 01 01',
                    biography: 'AAA...')

user_accepted = User.create( email: 'uacc@test.fr',
                    password: 'azerty',
                    password_confirmation: 'azerty',
                    name: 'user accepted',
                    phone_number: '07 01 01 01 01',
                    biography: 'AAA...')

user_expired = User.create( email: 'uex@test.fr',
                    password: 'azerty',
                    password_confirmation: 'azerty',
                    name: 'user expired',
                    phone_number: '07 01 01 01 01',
                    biography: 'AAA...')

puts "Creating #{User.all.size}/4 users"

workstation1 = Workstation.create(name: 'Station F')
workstation2 = Workstation.create(name: 'L\'anticafé')

puts "Creating #{Workstation.all.size}/2 workstations"

request_unconfirmed = Request.create( workstation: workstation1,
                                      user: user_unconfirmed,
                                      status: 'pending')

request_confirmed = Request.create( workstation: workstation1,
                                      user: user,
                                      status: 'pending')

request_accepted = Request.create( workstation: workstation1,
                                      user: user_accepted,
                                      status: 'accepted',
                                      signature_date: Date.today + 2.day)

request_expired = Request.create( workstation: workstation1,
                                      user: user_expired,
                                      status: 'expired')

puts "Creating #{Request.all.size}/4 requests"

