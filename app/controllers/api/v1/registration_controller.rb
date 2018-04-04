module Api
  module V1 
    class RegistrationController < ApiController
      skip_before_action :authenticate_request

      def register
        @user = User.create(user_params)
        if @user.save
          render json: { message: 'Учетная запись была создана' }, status: 201
        else
          render json: @user.errors, status: 400
        end
      end

      private

        def user_params
          params.require(:user).permit(:username, :password, :password_confirmation)
        end

    end
  end
end