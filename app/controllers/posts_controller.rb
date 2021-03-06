class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def like
  @post = Post.find(params[:post_id])
  @post.increment! :likes
  redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :blogger_id, :destination_id, :likes)
  end

end
