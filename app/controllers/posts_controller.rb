require 'pry'
class PostsController < ApplicationController

  # GET: /posts
  get "/posts" do
    @users = User.all
    erb :"/posts/index.html"
  end

  # GET: /posts/new
  get "/posts/new" do
    if session[:user_id]
    erb :"/posts/new.html"
    else
    redirect "/posts"
    end
  end

  # POST: /posts
  post "/posts" do
    movie = Movie.find_by(title: params[:title])
    if movie && !params[:content].empty? && !params[:user_rating].empty?
      post = Post.create(content: params[:content], user_rating: params[:user_rating], movie_id: movie.id, user_id: session[:user_id])
      redirect "/posts/#{post.id}"
    else
      redirect "/posts/new"
    end
  end

  # GET: /posts/5
  get "/posts/:id" do
    @post = Post.find_by_id(params[:id])
    @session = session
    erb :"/posts/show.html"
  end

  # GET: /posts/5/edit
  get "/posts/:id/edit" do
    @post = Post.find_by_id(params[:id])
    if session[:user_id] == @post.user.id
    erb :"/posts/edit.html"
    else
      redirect "/posts"
    end
  end

  post "/posts/:id/edit" do
    post = Post.find_by_id(params[:id])
    if !params[:content].empty? && !params[:user_rating].empty?
    post.update(content: params[:content])
    post.update(user_rating: params[:user_rating])
    post.save
    redirect "/posts/#{params[:id]}"
    else
      redirect "/posts/#{params[:id]}/edit"
    end
  end


  # DELETE: /posts/5/delete
  get "/posts/:id/delete" do
    post = Post.find_by_id(params[:id])
    if session[:user_id] == post.user.id
      post.delete
      redirect "/users/#{session[:user_id]}"
    else
    redirect "/users/#{session[:user_id]}"
    end
  end




  end
