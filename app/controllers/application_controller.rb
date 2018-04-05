
require_relative '../../config/environment'
require_relative '../models/post.rb'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @posts = Post.all 

  	erb :index
  end
  
  get '/posts/new' do 
  	erb :new
  end
  
  get '/posts' do
	 @posts = Post.all
	 
   erb :index
  end

  get '/index/' do 
    @posts = Post.all 

  	erb :index
  end

  get '/show/' do 
  	@posts = Post.all 
  	erb :show
  end

  post '/posts' do 
  	@post = Post.create(name: params[:name],content:params[:content])
  	@posts = Post.all 
  	erb :index
  end

  get '/posts/:id' do 
  	@post = Post.find(params[:id])
  	if @post != nil
  		erb :show
  	else
  		erb :index
  	end
  end
  
  patch '/posts/:id' do
      @post = Post.find(params[:id])
      @post.name = params[:name]
      @post.content = params[:content]
     @post.save

      redirect_to "/posts/:id"
  end

  post '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete

    erb :delete
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  delete '/posts/:id/delete' do 
    @post = Post.find(params[:id])
    @post.destroy

    erb :index
  end

end
