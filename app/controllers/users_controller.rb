class UsersController < ApplicationController
  skip_before_action :check_parental_consent
  def consent
  end

  def update_consent
    if current_user.update(consent_params)
      redirect_to root_path, notice: "Parental consent info updated."
    else
      render :consent, alert: "Failed to update."
    end
  end

  private

  def consent_params
    params.require(:user).permit(:parent_email, :parental_consent)
  end
end
