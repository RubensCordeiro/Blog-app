class FriendsController < ApplicationController
  before_action :set_friend, only: [:add]

  def add
    if @friend.id != current_user.id
      @friendship = Friendship.new(user_id: current_user.id, friend_id: @friend.id)
      @friendship.save
    end
    redirect_to timeline_path
  end

  private
  
  def set_friend
    @friend = User.find(params[:author_id].to_i)
  end

end