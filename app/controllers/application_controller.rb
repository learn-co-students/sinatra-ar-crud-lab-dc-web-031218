
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
  Post.new(params).save
    erb :index
  end

  get '/posts' do
  @posts = Post.all
    erb :index
  end

get '/posts/:id' do
@post = Post.all.select do |post|
  post.id == params[:id].to_i
end.first
erb :show
end

get '/posts/:id/edit' do
  @post = Post.find_by(id: params[:id].to_i)
  erb :edit
end

patch '/posts/:id' do
  @post = Post.find_by(id: params[:id].to_i)
  @post.content = params[:content]
  @post.name = params[:name]
  @post.save
  erb :show
end

delete '/posts/:id/delete' do
  @post = Post.find_by(id: params[:id].to_i)
  @post.destroy
  erb :delete
end 

end
