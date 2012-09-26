class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def fbconnect
    user = User.fbconnect(params)
    if user
      session[:user_id] = user.id
      sign_in user
      render :json => {:err_msg => false}
    else
      render :json => {:err_msg => true}
    end
  end
end
