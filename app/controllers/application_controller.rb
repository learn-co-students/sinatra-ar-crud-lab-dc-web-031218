
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  	@posts = Post.all
  	erb :index
  end

  #Create
  get '/posts/new' do
  	erb :new
  end

  post '/posts' do
  	@post = Post.create(name: params[:name], content: params[:content])
  	redirect to "/posts"
  end
  #Read
  get '/posts' do
  	@posts = Post.all

  	erb :index
  end

  #Read
  get '/posts/:id' do
  	@post = Post.find(params[:id])
  	erb :show 
  end


  #Update
  get '/posts/:id/edit' do
  	@post = Post.find(params[:id])

    # @landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed], 
    #                 figure_id: params[:landmark][:figure_id])
  	erb :edit
  end


  #Update
  patch '/posts/:id' do
  	@post = Post.find(params[:id])
  	
  	@post.update(name: params[:name],
  		content: params[:content],
  		)

  	redirect to "/posts/#{@post.id}"
  end


  #Delete
  delete '/posts/:id/delete' do
  	Post.find(params[:id]).destroy
  	redirect to "/"
  end

end
