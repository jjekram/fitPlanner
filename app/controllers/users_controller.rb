class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def index
    redirect_to root_path
  end

  def create
  	@user = User.new(params[:user]);
  	if @user.save
      
      redirect_to @user
  	else
  		render 'new'
  	end
  end	

  def edit
  end

  def show
  	@user = User.find(params[:id])
  end
end
