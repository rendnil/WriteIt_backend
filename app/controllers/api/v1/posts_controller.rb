class Api::V1::PostsController < ApplicationController

  def index
    @posts = Post.all
    render json: @posts
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    render json: @post

  end


  private
  def post_params
    params.require(:post).permit(:upvotes, :downvotes)
  end



end
