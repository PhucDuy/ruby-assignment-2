
class SessionsController < ApplicationController
  def new
  end

  def create

    if @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
        flash[:success] = "Welcome #{@user.name}"
        session[:user_id] = @user.id
        redirect_to messages_path
      else
        flash[:errors] = "Wrong password"
        render 'new'
      end
    else
      flash[:errors] = "Email not found"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: {success: "Logged out"}
  end
end
