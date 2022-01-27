class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
  end

  def timeline
    @posts = Post.where(public: true).order('created_at DESC')
  end

end