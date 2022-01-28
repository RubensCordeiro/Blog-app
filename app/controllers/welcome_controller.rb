class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_privacy, only: [:timeline]

  def index
  end

  def timeline
    @posts = Post.where(public: true).order('created_at DESC')
    @private_posts = Post.where(public: false).select { |post| @allowed_users.include?(post.user_id)}
  end

  private

  def set_privacy
    @allowed_users = []
    Friendship.where(friend_id: current_user.id).each do |friendship|
      @allowed_users << friendship.user_id
    end    
  end

end