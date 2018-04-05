module Api
  module V1
    class UsersController < ApiController

      def update
        if current_user.update_attributes!(user_params)
          render json: { message: 'Изменения сохранены', user: current_user.to_json(only: [:id, :name, :email, :username]) }, status: 200
        else
          render json: current_user.errors, status: 400
        end
      end

      private

        def user_params
          params.require(:user).permit(:email, :username)
        end

    end
  end
end