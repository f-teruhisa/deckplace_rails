module Api
  module V1
    # Controller as the base of this application
    class ApplicationController < ActionController
      # Skip to not use tokens for CSRF protection
      skip_before_action :verify_authenticity_token

      # Checks that the request is an xhr(XMLHttpRequest)
      before_action :check_xhr_header

      private

      def check_xhr_header
        return if request.xhr?

        render json: { error: 'forbidden' }, status: :forbidden
      end
    end
  end
end
