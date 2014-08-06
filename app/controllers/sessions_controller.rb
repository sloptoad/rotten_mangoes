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

  def destroy
    session.clear[:user_id]
    redirect_to movies_path, notice: "Adios!"
  end

end
