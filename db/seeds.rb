10.times do
  Contact.create(name: Faker::Name.name, email: Faker::Internet.email)
end

10.times do
  Address.create(street: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip, contact_id: rand(1..10))
end
