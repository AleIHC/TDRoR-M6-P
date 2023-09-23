class EiAdminDashboardController < ApplicationController
    before_action :authenticate_ei_user!
  
  def index
    @admin = current_ei_user
    @notifications = EiNotification.where(admin_user: 1).order(created_at: :desc)
    puts @notifications.to_sql
    
    render template: 'ei_admin_dashboard/index'
  end

    
end
