class Api::V1::VotesController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :update]

  def index
    @votes = Post.all
    render json: @votes
  end



end
