class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_parental_consent, unless: :devise_controller?

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:date_of_birth])
    devise_parameter_sanitizer.permit(:account_update, keys: [:parent_email, :parental_consent])
  end

  def check_parental_consent
    if current_user&.needs_parental_consent?
      redirect_to consent_users_path, alert: "Parental consent is required to use these features."
    end
  end
end
