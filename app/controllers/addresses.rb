# CREATE NEW ADDRESS ROUTES

get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id])
  @address = Address.new

  erb :"addresses/new"
end

post '/contacts/:id/addresses' do
  @contact = Contact.find(params[:id])
  @address = Address.create!(params[:address])
  @address.update_attributes(contact: @contact)
  @address.save

  redirect to "/contacts/#{params[:id]}"
end

# EDIT ADDRESS ROUTES

get '/contacts/:id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:address_id])

  erb :"addresses/edit"
end

put '/contacts/:id/addresses/:address_id' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:address_id])
  @address.update_attributes(params[:address])
  # @address.update_attributes(contact: @contact)
  # @contact.save
  # @address.save

  redirect to "/contacts/#{params[:id]}"
end
