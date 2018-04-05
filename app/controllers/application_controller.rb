
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

  get '/posts/new' do #load new post form
    erb :new
  end

  post '/posts' do #creates new post
    Post.create(params)
    #@posts = Post.all
    erb :index
  end
  
  #READ
  get '/posts' do   #index
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do    #show
    @post = Post.find(params[:id])
    erb :show
  end

  #UPDATE
  get '/posts/:id/edit' do  #load edit form
     @post = Post.find(params[:id])
    erb :edit
  end  

  patch '/posts/:id' do  #edit action
        @post = Post.find(params[:id])
        @post.update(name: params[:name], content: params[:content])
        erb :show
      end

  #DELETE

  delete '/posts/:id/delete' do  #delete action
      @post = Post.find(params[:id])
      @post.delete
      erb :delete
    end


 end
