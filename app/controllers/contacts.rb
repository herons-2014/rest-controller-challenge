get '/contacts' do
@contacts = Contact.all
  erb :'/contacts/index'
end

get '/contacts/new' do
  @contact = Contact.new
  erb :'/contacts/new'

end

post '/contacts' do
  Contact.create(params[:contact])
  redirect '/contacts'
end

get '/contacts/:contact_id/edit' do
  @contact = Contact.find(params[:contact_id])
  erb :'/contacts/edit'
end

post '/contacts/:contact_id' do
  Contact.find(params[:contact_id]).destroy
  Contact.create(params[:contact])
  redirect '/contacts'
end

get '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  erb :'/contacts/show'
end




