get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id])
  @address = Address.new()
  erb :"addresses/new"
end

get '/contacts/:id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:id])
  @address = @contact.addresses.find(params[:address_id])
  erb :"addresses/edit"
end

post '/contacts/:id/addresses' do
  @contact = Contact.find(params[:id])
  @contact.addresses << Address.new(params[:address])
  redirect "/contacts/#{params[:id]}"
end

post '/contacts/:id/addresses/:address_id' do
  @contact = Contact.find(params[:id])
  @contact.addresses.find(params[:address_id]).update(params[:address])
  redirect "/contacts/#{params[:id]}"
end
