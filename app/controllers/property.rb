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
	@bookings = Booking.where(property_id: params[:id])
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


#************************************************

#new booking
get '/properties/:id/bookings/new' do
	@property = Property.find(params[:id])
	@user = User.find_by(id: @property.user_id)
	@message = "Message cannot be empty"
	erb :'bookings/new'
end

#submit booking
post '/properties/:id/bookings' do
	@property = Property.find(params[:id])
	@booking = Booking.new(params[:booking])

	if @booking.save
		redirect to "/bookings/#{@booking.id}"
	else
		@error_message = "No input.Please enter your message"
		@user = User.find_by(id: @property.user_id)
		erb :'bookings/new'	
	end
end

#view booking
get '/bookings/:id' do
	@booking = Booking.find_by(id: params[:id])
	@property = Property.find(@booking.property_id)
	@user = User.find_by(id: @property.user_id)
	erb :'bookings/show'
end

#edit booking
get '/bookings/:id/edit' do
	@booking = Booking.find_by(id: params[:id])
	@property = Property.find(@booking.property_id)
	@user = User.find_by(id: @property.user_id)
	erb :'bookings/edit'
end

#update booking
post '/bookings/:id' do
	@booking = Booking.find(params[:id])
	if @booking.update(params[:booking])
		redirect to "/bookings/#{@booking.id}"
	else
		erb :'bookings/edit'
	end
end

#delete booking
get '/bookings/:id/delete' do
	@booking = Booking.find(params[:id])
	@booking.destroy
	redirect to '/'
end