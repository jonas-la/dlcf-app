class OfficerDashboardController < ApplicationController
  def index
    @user_email = current_admin.email
  end
end
