get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id])
  @address = Address.new
  erb :"addresses/new"
end

get '/contacts/:id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:address_id])
  erb :"addresses/edit"
end

post '/contacts/:id/addresses' do
  info = params["address"]
  @contact = Contact.find(params["id"])
  new_address = Address.create!(street: info["street"],
                                city: info["city"],
                                state: info["state"],
                                zip: info["zip"])
  @contact.addresses << new_address
  puts @contact.id
  puts "/contacts/#{@contact.id}"
  redirect to ("/contacts/#{@contact.id}")
end

post '/contacts/:id/addresses/:address_id' do
  info = params["address"]
  @address = Address.find(params["address_id"])
  @address.street = info["street"]
  @address.city = info["city"]
  @address.state = info["state"]
  @address.zip = info["zip"]
  @address.save
  redirect to ("/contacts/#{@address.contact_id}")
end

