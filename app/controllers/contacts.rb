

get '/contacts' do
  @contacts = Contact.all

  erb :"contacts/index"
end

post '/contacts' do
  @contact = Contact.create!(params[:contact])
  redirect '/contacts'
end

get '/contacts/new' do
  @contact = Contact.new()
  erb :"contacts/new"
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @address = Address.new()
  erb :"contacts/show"
end


get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :"contacts/edit"
end

put '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.update(params[:contact])
  redirect '/contacts'
end


delete '/contacts/:id' do
  Contact.find(params[:id]).destroy
  redirect '/contacts'
end

get '/contacts/:id/show' do
  @contact = Contact.find(params[:id])
  erb :"contacts/show"
end
