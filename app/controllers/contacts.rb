get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end

get '/contacts/new' do
  @contact = Contact.new
  erb :'contacts/new'
end

post '/contacts' do
  Contact.create(params[:contact])
  redirect 'contacts'
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :'contacts/show'
end

get '/contacts/:id/edit' do  # EDIT
  @contact = Contact.find(params[:id])
  erb :'contacts/edit'
end

post '/contacts/:id' do  ##  EDIT
  contact = Contact.find(params[:id])
  contact.update(params[:contact])
  redirect 'contacts'
end

delete '/contacts/:id' do  # DELETE
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect 'contacts'
end









