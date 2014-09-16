# get '/addresses' do
#   erb :"addresses/index"
# end

get '/contacts/:id/addresses/new' do
 @contact = Contact.find(params[:id])
 @address = Address.new
 erb :"addresses/new"
end

post '/contacts/:id/addresses' do
  @contact = Contact.find(params[:id])
  @address = Address.create!(params[:address])
  @address.update_attributes(contact: @contact)
  @address.save
  redirect to "/contacts/#{params[:id]}"
end

get '/contacts/:id/addresses/:id1/edit' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:id1])
  erb :'addresses/edit'
end

put '/contacts/:id/addresses/:id1' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:id1])
  @address.update_attributes(params[:address])
  p @address
  puts
  redirect to "/contacts/#{params[:id]}"
end

