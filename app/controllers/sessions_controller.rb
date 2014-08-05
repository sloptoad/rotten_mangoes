class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to movies_path notice: "Hey there, #{user.firstname}! "
    else
      flash.now[:alert] = "Uhh.. you fudged up the login, idiot"
      render :new
    end
  end
end
