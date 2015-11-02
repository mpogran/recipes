class SessionsController < ApplicationController

  # GET /login
  def new
    @large_logo = true
  end

  # POST /login
  def create
    user = User.find_by_email(session_params[:email])

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id

      flash[:success] = "Welcome back #{user.email}!"
      redirect_to home_path
    else
      flash[:error] = 'Unknown username and password.'
      redirect_to login_path
    end
  end

  # GET /logout
  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private
  def session_params
    params[:user]
  end

end
