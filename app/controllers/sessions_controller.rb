class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
      
    else
      redirect_to login_path, notice: "Invalid email and/or password."
    end
    
  end

  def index
    redirect_to root_path
  end

  def destroy
    log_out
    redirect_to login_path

  end
end
