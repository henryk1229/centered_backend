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

  def profile

    token = request.headers['Authorization']
    decoded_token = JWT.decode token, 'baboon', true, { algorithm: 'HS256'}
    user_id = decoded_token[0]['user_id']

    render json: current_user
  end

  private
    params.permit(:username, :email, :password)
  end

end
