class PostsController < ApplicationController
  before_action :check_ownership, only: [:edit, :update, :destroy]
  before_action :set_post, only: [:edit, :update, :destroy, :show]

  def new
  end

  def show
  end

  def create
    if Post.new(post_params).save
      flash[:notice] = "Post created successfully"
      redirect_to user_index_path
    else
      flash[:alert] = "Something went wrong, your post was not created"
      redirect_to post_new_path
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post updated successfully"
    else
      flash[:alert] = "Something went wrong, your post was not updated"
    end
    redirect_to user_posts_path
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Post deleted successfully"
    else
      flash[:alert] = "Something went wrong, your post was not deleted"
    end
    redirect_to user_posts_path
  end

  private

  def post_params
    if params[:post]
      params.require(:post).permit(:id, :title, :summary, :description, :public)
    else
      {
        title: params[:title],
        summary: params[:summary],
        description: params[:description],
        user_id: current_user.id,
        public: params[:public] == "1" ? true : false
      }
    end  
  end

  def set_post
    @post = Post.find(post_params[:id] || params[:id])
  end

  def check_ownership
    post_id = post_params[:id] || params[:id]
    if current_user.id == Post.find(post_id).user_id
      @post = Post.find(post_id)
      return @post
    else
      flash[:alert] = "You can only edit your own post"
      redirect_to user_posts_path
    end
  end

end