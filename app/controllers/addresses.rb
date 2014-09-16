get '/addresses' do
  @addresses = Address.all

  erb :"addresses/index"
end

get '/addresses/edit' do

  erb :"addresses/edit"
end

get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id])
  @address = Address.new

  erb :"addresses/new"
end

post '/contacts/:id/addresses' do
  # @address = Address.create(params[:address])

  @contact = Contact.find(params[:id])
  @contact.addresses << Address.create(params[:address])
  # @address.contact_id = @contact.id
  # @address.save

  redirect "/contacts/#{@contact.id}"
end

get "/contacts/:contact_id/addresses/:address_id/edit" do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:address_id])

  erb :"addresses/edit"
end

post "/contacts/:contact_id/addresses/:address_id" do
  @address = Address.find(params[:address_id])
  @contact = Contact.find(params[:contact_id])
  @address.update_attributes(params[:address])
  @address.save

  redirect "/contacts/#{@contact.id}"
end


