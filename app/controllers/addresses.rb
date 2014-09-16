get '/contacts/:id/addresses/new' do
@contact = Contact.find(params[:id])
@address = Address.new
erb :'addresses/new'
end

post '/contacts/:id/addresses' do
  @contact = Contact.find(params[:id])
  @address = Address.new(params[:address])
  @address.contact_id = @contact.id
  @address.save
  redirect "/contacts/#{@contact.id}"
end

get '/contacts/:id/addresses/:od/edit' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:od])
  erb :'/addresses/edit'
end

post '/contacts/:id/addresses/:od/delete' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:od])
  @address.destroy
  redirect "/contacts/#{@contact.id}"
end

post '/contacts/:id/addresses/:od' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:od])
  @address.update(params[:address])
  redirect "/contacts/#{@contact.id}"
end
