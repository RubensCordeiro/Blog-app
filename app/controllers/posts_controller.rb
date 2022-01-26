class PostsController < ApplicationController
  def new
  end

  def create
    render json: post_params
  end

  private

  def post_params
    {
      title: params[:title],
      description: params[:description],
      user_id: current_user.id,
      public: params[:public]
    }
  end

  def set_post
  end
end