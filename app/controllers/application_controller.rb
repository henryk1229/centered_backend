class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, 'b@boon')
  end

  def auth_header
    request.headers["Authorization"]
  end

  def decoded_token
    if auth_header
      begin
        JWT.decode(auth_header, 'b@boon')[0]["user_id"]
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def session_user

    User.find_by(id: decoded_token)

  end

  def logged_in?
    !!session_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

end
