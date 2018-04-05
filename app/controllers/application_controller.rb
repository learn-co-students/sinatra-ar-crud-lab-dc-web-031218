require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/posts/new' do

    erb :new
  end

  post '/posts' do
    #create blog post and save to DB
    #binding.pry
    @post = Post.create(params)
    #erb :index
    redirect to "/posts"
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect_to "/posts/:id"
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    redirect to '/posts'
  end

end
