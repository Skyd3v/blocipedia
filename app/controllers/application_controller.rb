class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    private

    def user_not_authorized
        flash[:alert] = 'You are not authorized to do that.'
        redirect_to root_path
    end
end
