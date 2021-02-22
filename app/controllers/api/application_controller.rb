module Api
  # Controller as the base of this application
  class ApplicationController < ApplicationController
    # Checks that the request is an xhr(XMLHttpRequest)
    before_action :check_xhr_header

    private

    def check_xhr_header
      return if request.xhr?

      render json: { error: 'forbidden' }, status: :forbidden
    end
  end
end
