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

post '/contacts/new' do
  info = params["contact"]
  Contact.create!(name: info["name"], email: info["email"])
  redirect to('/contacts')
end

put '/contacts/:id' do
  contact = Contact.find(params["id"])
  info = params["contact"]
  contact.name = info["name"]
  contact.email = info["email"]
  contact.save
  redirect to('/contacts')
end

delete '/contacts/:id' do
  contact = Contact.find(params["id"])
  contact.destroy
  redirect to('/contacts')
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :"contacts/show"
end


