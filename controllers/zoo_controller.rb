class ZooController < Sinatra::Base
	 # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # Turn on Sinatra Reloader
  configure :development do
      register Sinatra::Reloader
  end

# INDEX
  get '/' do
  	@title = "Kudz Zoo"
  	@zoo = Zoo.all

  	erb :'zoo/index'
  end
# NEW
  get '/new' do
  	@zoo = Zoo.new
  	erb :'zoo/new'

  end
# SHOW
  get '/:id' do
  	id = params[:id].to_i
  	@zoo = Zoo.find id
  	erb :'zoo/show'
  end

  post '/' do
  	zoo = Zoo.new
  	zoo.title = params[:title]
  	zoo.sea = params[:sea]
  	zoo.forest = params[:forest]
  	zoo.safari = params[:safari]
  	zoo.mountains = params[:mountains]


  	zoo.save

  	redirect "/"

  end

  put '/:id' do
  	id = params[:id].to_i
  	zoo = Zoo.find id
  	zoo.title = params[:title]
  	zoo.sea = params[:sea]
  	zoo.forest = params[:forest]
  	zoo.safari = params[:safari]
  	zoo.mountains = params[:mountains]

  	zoo.save

  	redirect "/";
  end

	delete '/:id' do
	id = params[:id].to_i
	Zoo.destroy id

	redirect "/"
	end

	get '/:id/edit' do
	id = params[:id].to_i

	@zoo = Zoo.find id
	erb :'zoo/edit'
	end
end






