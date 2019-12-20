class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i(new create)

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new post_params
    if @post.save
      flash[:success] = "Create post success"
      redirect_to root_url
    else
      flash.now[:danger] = "Create post fail"
      render :new
    end
  end

  def index
    @posts = Post.page(params[:page]).per 10
  end

  private

  def post_params
    params.require(:post).permit :title, :content
  end
end
