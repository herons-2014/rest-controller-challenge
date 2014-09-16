get '/contacts' do
  @contacts = Contact.all
  erb :"contacts/index"
end

get '/contacts/new' do
  @contact = Contact.new
  erb :"contacts/new"
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :"contacts/edit"
end

post "/contacts/:id" do
  contact = Contact.find(params[:id])
  if params[:contact]
    contact.name = params[:contact][:name]
    contact.email = params[:contact][:email]
    contact.save
    redirect to("/contacts/#{params[:id]}")
  else
    contact.destroy
    redirect to("/contacts")
  end
end

post '/contacts' do
  contact = params[:contact]
  Contact.create!(contact)

  redirect to("/contacts")
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :"contacts/show"
end
