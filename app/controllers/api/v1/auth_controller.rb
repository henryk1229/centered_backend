 module Api
   module V1
     class AuthController < ApplicationController
       def login
         #params: { username: '', password: '' }
         #find user
         user = User.find_by(username: params["username"])
         #authenticate user
         is_authenticated = user.authenticate(params["password"])



         if is_authenticated
           render json: { token: encode_token(user) }
         else
           render json: { error: "Wrong username or password" }
         # "log in" user
       end
     end
   end
 end
