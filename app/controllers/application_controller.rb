require './config/environment'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  post "/login" do
    user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect to "/users/#{user.id}"
      else
        redirect to "/"
      end
    end

  get "/" do
    if session[:user_id]
      redirect "/users/#{session[:user_id]}"
    else
    erb :welcome
    end
  end

  get "/logout" do
    session.clear
    redirect "/"
  end



end
