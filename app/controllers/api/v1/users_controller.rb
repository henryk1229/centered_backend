class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users

  end

  def show
    user = User.find(user_params)

    render json: user
  end

  def create
    user = User.create(user_params)

    is_valid = user.valid?

    if is_valid
      render json: { token: encode_token(user) }
    end
  end

  def profile
    render json: session_user
  end

  private

  def user_params
    params.permit(:username, :email, :password, :koan_number)
  end

end
