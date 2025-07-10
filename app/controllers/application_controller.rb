class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authenticate_user!

  def after_sign_up_path_for(resource)
    root_path # or your dashboard path, like dashboard_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
