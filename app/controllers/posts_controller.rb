class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :image, :image_cache)
  end
end
