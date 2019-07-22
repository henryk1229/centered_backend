class ApplicationController < ActionController::API
  def user_payload(user)
    { user_id: user.id }
  end
  def encode_token(user)
    JWT.encode(user_payload(user), 'baboon', 'HS256')
  end 
end
