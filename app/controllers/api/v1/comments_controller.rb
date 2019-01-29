class Api::V1::CommentsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :update]

  def index
    @comments = Comment.all
    render json: @comments
  end

  def create
    @comment = Comment.create(comment_params)

    if @comment.valid?
      render json: @comment, status: :created
    else
      render json: { error: 'Failed to Create Comment' }, status: :not_acceptable
    end

  end


  private
  def comment_params
    params.require(:comment).permit(:post_id, :commenter_id, :content)
  end





end
