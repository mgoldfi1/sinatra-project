require 'pry'
class PostsController < ApplicationController

  # GET: /posts
  get "/posts" do
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
    erb :"/posts/show.html"
  end

  # GET: /posts/5/edit
  get "/posts/:id/edit" do
    erb :"/posts/edit.html"
  end

  # PATCH: /posts/5
  patch "/posts/:id" do
    redirect "/posts/:id"
  end

  # DELETE: /posts/5/delete
  delete "/posts/:id/delete" do
    redirect "/posts"
  end
end
