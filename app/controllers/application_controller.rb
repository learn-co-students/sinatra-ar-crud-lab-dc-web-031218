
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post "/posts" do
    # use the Create CRUD action to create the blog post and
    # save it to the database
    @params = params
    Post.create(name: @params["name"], content: @params["content"])
    erb :index
  end

  get "/posts" do
    # should use Active Record to grab all
    # of the posts and store them in an instance variable, @posts.
    # then render the index.erb view. That view should use erb to
    # iterate over @posts and render them on the page.
    @posts = Post.all
    erb :index
  end

  get "/posts/:id" do
    # should use Active Record to grab the post with the id
    # that is in the params and set it equal to @post. Then,
    # it should render the show.erb view page. That view
    # should use erb to render the @post's title and content.
    @id = params["id"].to_i
    @post = Post.find(@id)
    erb :show
  end

  get '/posts/:id/edit' do
    # view should contain a form to update a specific
    # blog post and POSTs to a controller action, patch '/posts/:id'
    @id = params["id"].to_i
    @post = Post.find(@id)
    erb :edit
  end

  patch '/posts/:id' do
    @id = params["id"].to_i
    @post = Post.find(@id)
    @post.update(name: params["name"], content: params["content"])
    erb :show
  end

  delete '/posts/:id/delete' do
    @id = params["id"].to_i
    @post = Post.find(params[:id])
    @post_name = @post.name
    @post.destroy
    erb :delete
  end
end
