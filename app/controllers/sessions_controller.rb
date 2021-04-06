# create (login) and destroy (logout) sessions
class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # if user exists and password entered is correct
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # save user id inside browser cookie - how we keep user logged in when they navigate around website
      session[:user_id] = user.id
      redirect_to '/'
    else 
      # if user's login doesn't work, send them back to login form
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
