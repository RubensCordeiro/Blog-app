class UsersController < ApplicationController
  def index
  end

  def my_posts
    @posts = Post.where(user_id: current_user.id)
  end
end