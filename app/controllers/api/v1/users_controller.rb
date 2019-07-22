module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = User.create(user_params)

        is_valid = user.valid?

        if is_valid
          render json: { token: encode_token(user) }
      end

      def profile
        user = User.find(user_id)

        render json: user
      end

      private
        params.permit(:username, :email, :password)
      end

    end
  end
end
