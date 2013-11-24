class UsersController < ApplicationController
  before_filter :logged_in_user, only: [:edit, :update]
  before_filter :allowed_user,   only: [:edit, :update]

  def new
  	@user = User.new
  end

  def index
    redirect_to root_path
  end

  def create
  	@user = User.new(params[:user]);
  	if @user.save
      log_in @user
      redirect_to root_path
  	else
  		render 'new'
  	end
  end	

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      log_in @user
      redirect_to root_path
    else
      render 'edit'
    end

  end

  def show
  	@user = User.find(params[:id])
  end

  private

    def logged_in_user
      redirect_to login_path, notice: "Please log in." unless logged_in?
    end

    def allowed_user
      @user = User.find(params[:id])
      if @user != current_user 
         redirect_to root_path
      end
      
    end
end
