require "sinatra"
require "sinatra/reloader" if development?


get "/" do 
	if params[:button] == nil
		erb :main
	else
		hello
	end
end

get "/pass" do
	erb :pass
end