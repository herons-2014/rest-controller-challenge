get '/contacts/:contact_id/addresses/new' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.new
  erb :'/addresses/new'
end

post '/contacts/:contact_id/addresses' do
  Contact.find(params[:contact_id]).addresses.create(params[:address])
  redirect "/contacts/#{params[:contact_id]}"
end

get '/contacts/:contact_id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:address_id])
  erb :'/addresses/edit'
end

post '/contacts/:contact_id/addresses/:address_id' do
  Address.find(params[:address_id]).update_attributes(params[:address])
  redirect "/contacts/#{params[:contact_id]}"
end



