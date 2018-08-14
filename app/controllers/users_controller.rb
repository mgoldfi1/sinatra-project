require 'pry'
class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    if !params[:username].empty? && !params[:password].empty? && !params[:email].empty?
    user = User.create(username: params[:username], password: params[:password], email: params[:email])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
    else
      redirect "/users/new"
    end
  end

  # GET: /users/5
  get "/users/:id" do
    @user = User.find_by_id(params[:id])
    @posts = @user.posts
    @session = session
    erb :"/users/show.html"
  end

end
