# RETRIEVE ALL CONTACTS - direct to the contacts page and list all existing contacts

get '/contacts' do 
  @contacts = Contact.all 

  erb :"contacts/index"
end

# CREATE NEW CONTACTS - direct to the new contact page where there is a form to fill out (will need a post route now!)

get '/contacts/new' do 
  @contact = Contact.new # why is this 'new' and not 'create?'

  erb :"contacts/new"
end

# Whenever there is a form that needs to be filled out, a post route is needed so that the inputted information is sent back properly 

post '/contacts' do 
  @contact = Contact.create(params[:contact])

  redirect to "/contacts" # After the form has been filled out and submitted, send the user back to the contacts page where the new contact (as well as the others) will be displayed
end

# EDIT A CONTACT 

# First, find the specific contact and show it (there will be an edit button on that page)

get '/contacts/:id' do 
  @contact = Contact.find(params[:id])

  erb :"contacts/show"
end

# Now that a contact is being shown, press the edit button and direct to that page

get '/contacts/:id/edit' do 
  @contact = Contact.find(params[:id])

  erb :"contacts/edit"
end

# Now that we are on the edit page and have filled out our new info and have hit the save button, we need to have a post method that redirects back to the main list of contacts

# Find the contact and update its atributes

post '/contacts/:id' do 
  @contact = Contact.find(params[:id])
  @contact.update_attributes(params[:contact])

  redirect to "/contacts" # can redirect anywhere but it made sense that the user would be taken back to the main contacts page. The route below takes the user to the contact's page
  # redirect to "/contacts/#{params[:id]}"
end

# DELETE A CONTACT 

# Find the contact that you would like to delete and detroy it!
# Don't forget to hide the action in the edit view, right beneath form action!!

delete '/contacts/:id' do 
  @contact = Contact.find(params[:id])
  @contact.destroy

  redirect to "/contacts" # like above, we can ridirect to anywhere but this seems to make the most sense
end