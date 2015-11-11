get '/' do
  #latest entry on top
  @properties = Property.order('id DESC')
  erb :"static/index"
end

get '/home' do
	redirect to '/'
end