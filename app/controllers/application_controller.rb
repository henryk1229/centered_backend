class ApplicationController < ActionController::API
  def user_payload(user)
    { user_id: user.id }
  end

  def encode_token(user)
    JWT.encode(user_payload(user), 'baboon', 'HS256')
  end

  def token
    token = request.headers["Authorization"]
  end

  def decoded_token
    JWT.decode(token, 'baboon', true, { algorithm: 'HS256'})
  end

  def session_user
    User.find(decoded_token[0]["user_id"])
  end
end
