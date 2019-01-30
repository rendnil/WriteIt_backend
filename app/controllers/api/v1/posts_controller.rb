class Api::V1::PostsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :update, :comments]

  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    @post = Post.create(post_params)

    if @post.valid?
      render json: @post, status: :created
    else
      render json: { error: 'Failed to create post' }, status: :not_acceptable
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    render json: @post
  end

  def comments
    @post = Post.find(params[:id])
    @comments = @post.comments
    render json: @comments

  end


  private
  def post_params
    params.require(:post).permit(:author_id, :title, :content)
  end



end
