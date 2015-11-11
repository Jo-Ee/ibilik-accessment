helpers SessionHelper

#render property form
get '/properties/new' do
	erb :'properties/new'
end

#create new property
post '/properties' do
	@property = Property.new(params[:property])

	if @property.save
		redirect to "/properties/#{@property.id}"
	else
		@error_message = "Inputs incomplete. Please fill up all fields below"
		erb :'properties/new'
	end
end 

get '/properties/:id' do
	@property = Property.find(params[:id])
	@user = User.find_by(id: @property.user_id)
	erb :'properties/show'
end

#render edit form
get '/properties/:id/edit' do
	@property = Property.find(params[:id])
	erb :'properties/edit'
end

#post update
post '/properties/:id' do
	@property = Property.find(params[:id])
	if @property.update(params[:property])
		redirect to "/properties/#{@property.id}"
	else
		erb :'properties/edit'
	end
end

#delete property posting
get '/properties/:id/delete' do
	@property = Property.find(params[:id])
	@property.destroy
	redirect to '/'
end