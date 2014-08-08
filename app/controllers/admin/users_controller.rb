class Admin::UsersController < ApplicationController
 
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!"
    else
      render :new
    end
  end

  def update
    # @user = User.find(params[:id])

    # if @user.update_attributes(user_params)
    #   redirect_to movies_path #???
    # else
    #   render :edit
    # end
  end

  def destroy
    @user = User.find(params[:id])
    # @user.destroy
    UserMailer.delete_notification(@user).deliver
    redirect_to movies_path
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end

end
