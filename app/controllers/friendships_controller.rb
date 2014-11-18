class FriendshipsController < ApplicationController

  def create
    friendship = current_user.friendships.create!(friend_id:params[:friend_id])
    redirect_to :back, notice: "Friend #{friendship.friend.name} added successfully."
  end

  def destroy
    friendship = current_user.friendships.find(params[:id])
    friend_name = friendship.friend.name
    friendship.destroy
    redirect_to :back, notice: "Friend #{friend_name} removed successfully."
  end
end
