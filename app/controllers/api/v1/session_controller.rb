module Api
  module V1
    # Perform login/logout processes
    class SessionController < Api::ApplicationController
      def log_in
        user = User.find_for_database_authentication(email: user_params[:email])

        return render json: { result: false } if user.nil?

        if user.valid_password?(user_param[:password])
          sign_in :user, user
          render json: { state: true }
        else
          render json: { state: false }
        end
      end

      def log_out
        sign_out current_account
        render json: { state: true }
      end

      private

      def user_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
