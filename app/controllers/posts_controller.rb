class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i(new create)
  before_action :load_post, only: %i(show)

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new post_params
    if @post.save
      flash[:success] = "Create post success"
      redirect_to post_path(@post)
    else
      flash.now[:danger] = "Create post fail"
      render :new
    end
  end

  def index
    @posts = Post.page(params[:page]).per 10
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit :title, :content
  end

  def load_post
    @post = Post.find_by id: params[:id]
    return if @post

    flash[:danger] = "Post not found"
    redirect_to root_url
  end
end
