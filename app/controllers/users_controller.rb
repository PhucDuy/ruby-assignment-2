class UsersController < ApplicationController

  def index
    @users = User.all_except(current_user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.name} "
      session[:user_id] = @user.id
      redirect_to messages_path
    else
      flash[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
      render 'new'
    end
  end

  def add_friend

  end

  def remove_friend

  end



  def user_params
    params.require(:user).permit(:name,:email,:password)
  end
end
