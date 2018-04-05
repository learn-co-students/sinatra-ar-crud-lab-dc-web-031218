
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
#CREATE
  get '/' do
    erb :new
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(params)
    @posts = Post.all
    erb :index
  end
  
  #READ
  get '/posts' do 
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do 
    @post = Post.find(params[:id])
    erb :show
  end

  #UPDATE
  get '/posts/:id/edit' do
     @post = Post.find(params[:id])
    erb :edit
  end  

  patch '/posts/:id' do
        @post = Post.find(params[:id])
        @post.update(name: params[:name], content: params[:content])
        erb :show
      end

  #DELETE

  delete '/posts/:id/delete' do
      @post = Post.find(params[:id])
      @post.destroy
      erb :delete
    end


 end
