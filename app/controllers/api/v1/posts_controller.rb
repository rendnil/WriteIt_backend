class Api::V1::PostsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :update]

  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    @post = Post.create(user_id: post_params["user_id"],title: post_params["title"],
    content: post_params["content"], upvotes: 0, downvotes: 0)

    if @post.valid?
      render json: @post, state: :created
    else
      render json: { error: 'Failed to Execute Trade' }, status: :not_acceptable
    end

  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    render json: @post

  end


  private
  def post_params
    params.require(:post).permit(:user_id, :title, :content, :upvotes, :downvotes)
  end



end
