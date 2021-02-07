module Api
  module V1
    # Controller that allows users to handle account information
    class UsersController < Api::V1::ApplicationController
      before_action :account_login

      def show
        render json: { email: current_account[:email] }
      end

      private

      def account_login
        # Retrun empty json unless logined
        # Not use `authenticate_account!` because don't want to redirect
        return render json: {} unless account_signed_in?
      end
    end
  end
end
