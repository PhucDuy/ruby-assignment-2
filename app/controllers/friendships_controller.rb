class FriendshipsController < ApplicationController
  def create
    if Friendship.between(current_user.id,params[:friend_id]).present?
      @friendship = Friendship.between(current_user.id,params[:friend_id]).first
      redirect_to users_path
    else
      @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
      if @friendship.save
        flash[:success] = "Added friend"
        redirect_to users_path
      else
        flash[:errors] = "#{@friendship.errors.full_messages.to_sentence}"
        redirect_to users_path
      end
    end
  end

  def destroy
    @friendship = Friendship.find_by_id(params[:id])
    @friendship.destroy
    redirect_to users_path
  end
end
