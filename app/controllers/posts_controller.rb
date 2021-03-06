class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update)
  load_and_authorize_resource

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
    @posts = @posts.page(params[:page]).per 20
  end

  def show
  end

  def edit
  end

  def update
    if @post.update_attributes post_params
      flash[:success] = "Update post success"
      redirect_to post_path(@post)
    else
      flash.now[:danger] = "Update post fail"
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = "Delete post success"
      redirect_to root_url
    else
      flash[:danger] = "Delete post fail"
      redirect_back fallback_location: root_url
    end
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
