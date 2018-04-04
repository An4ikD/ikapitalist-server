module Api
  module V1 
    class AuthenticationController < ApiController
      skip_before_action :authenticate_request

      def authenticate
        command = AuthenticateUser.call(params[:username], params[:password])
        if command.success?
          user = User.find_by_username(params[:username])
          render json: { auth_token: command.result, user: user.to_json(only: [:id, :name, :email, :username]) }
        else
          render json: { error: command.errors }, status: :unauthorized
        end
      end
      
    end
  end
end