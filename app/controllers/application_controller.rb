class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    include Pundit
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    def after_sign_in_path_for(_resource)
        wikis_path
  end
end
