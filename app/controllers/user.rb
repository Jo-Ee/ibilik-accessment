helpers SessionHelper

#render singup page
get '/signup' do 
	erb :'users/signup'
end

#create new user & log session
post '/user/new' do
	@user = User.new(params[:user])
	if @user.save
		session[:user_id] = @user.id
		redirect to '/'
	else
		erb :'users/signup'
	end
end

#render login page
get '/login' do
		erb :'users/login'
end

#user logs in
post '/login' do
	@user = User.authenticate(params[:email], params[:password])
	if @user
		session[:user_id] = @user.id
		redirect '/'
	else
		@message = "Invalid email or password."
		erb :'users/login'
	end
end


#user logout
get '/logout' do
	user_logout
	redirect to '/'
end

#view only user's property
get '/my_properties' do
	@my_properties = Property.where(user_id: current_user.id)
	erb :'users/my_properties'
end