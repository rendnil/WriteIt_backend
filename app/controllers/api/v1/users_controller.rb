class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]

  def index
    @users = User.all
    render json: @users
  end

  def profile
    # user is logged in and needs profile
    #current_user is from ApplicationController
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: {user: UserSerializer.new(@user), jwt:@token}, status: :created
    else
      # byebug
      # render json: {errors: @user.errors.full_messages}, status: :not_acceptable
      render json: {error: "failed to create"}, status: :not_acceptable

    end
  end

  private
  def user_params
    params.require(:user).permit(:username,:password)
  end



end
