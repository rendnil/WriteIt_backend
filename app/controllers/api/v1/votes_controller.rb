class Api::V1::VotesController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :update]

  def index
    @votes = Vote.all
    render json: @votes
  end

  def create
    @vote = Vote.create(vote_params)

    if @vote.valid?
      render json: {post: PostSerializer.new(@vote.post)}, status: :created
    else
      render json: { error: 'Failed to Create Vote' }, status: :not_acceptable
    end

  end


  private
  def vote_params
    params.require(:vote).permit(:post_id, :voter_id, :upvote)
  end




end
