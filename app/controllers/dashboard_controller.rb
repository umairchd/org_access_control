class DashboardController < ApplicationController

  def index
    @user_counts = Membership.group(:role).count
    @org_user_counts = Organization.joins(:memberships).group("organizations.name").count

    @organizations = current_user.organizations
    @membership_counts = {}

    @organizations.each do |org|
      @membership_counts[org.name] = org.memberships.group(:role).count
    end
  end
end
