get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id])
  @address = Address.new
  erb :"addresses/new"
end

post '/contacts/:id/addresses' do
  contact = Contact.find(params[:id])
  address = params[:address]
  contact.addresses << Address.new(address)
  redirect to("/contacts/#{params[:id]}")
end


get '/contacts/:contact_id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:address_id])

  erb :"addresses/edit"
end


post '/contacts/:contact_id/addresses/:address_id' do
  contact = Contact.find(params[:contact_id])
  address = Address.find(params[:address_id])
  address.update(params[:address])
  redirect to("/contacts/#{params[:contact_id]}")
end




