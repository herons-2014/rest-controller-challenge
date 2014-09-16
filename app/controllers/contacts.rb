get '/contacts' do
  @contacts = Contact.all

  erb :"contacts/index"
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])

  erb :"contacts/edit"
end

get '/contacts/new' do
  @contact = Contact.new

  erb :"contacts/new"
end

post '/contacts' do

  @contact = Contact.create(params[:contact])
  redirect '/contacts'
end

post '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.update_attributes(params[:contact])
  @contact.save

  redirect "/contacts/#{@contact.id}"
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])

  erb :"contacts/show"
end

post '/contacts/delete/:id' do
  @contacts = Contact.all
  @contact = Contact.find(params[:id])
  @contact.delete

  erb :"contacts/index"
end


