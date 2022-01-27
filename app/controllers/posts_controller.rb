class PostsController < ApplicationController
  before_action :set_post, only: [:create]

  def new
  end

  def create
    if @post.save
      flash[:notice] = "Post created successfully"
      redirect_to users_index_path
    else
      flash[:alert] = "Something went wrong, your post was not created"
      redirect_to posts_new_path
    end
  end

  def show
    if check_ownership(params[:post_id].to_i)
      render json: params
    end
  end

  private

  def new_post_params
    {
      title: params[:title],
      summary: params[:summary],
      description: params[:description],
      user_id: current_user.id,
      public: params[:public] == "1" ? true : false
    }
  end

  def set_post
    @post = Post.new(new_post_params)
  end

  def check_ownership(post_id)
    current_user.id == Post.find(post_id).user_id
  end
end