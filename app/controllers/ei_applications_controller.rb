class EiApplicationsController < ApplicationController
    before_action :authenticate_ei_user!, only: [:create]

    def index
      @ei_user = current_ei_user
      @ei_applications = @ei_user.ei_applications
    end
  

    def new
        @ei_job = EiJob.find(params[:ei_job_id])
        @ei_application = EiApplication.new
    end


    def create
        @ei_job = EiJob.find(params[:ei_job_id])
        @ei_application = @ei_job.ei_applications.build(ei_user: current_ei_user)
    
        if @ei_application.save
          notify_admin_application(@ei_application)
          flash[:notice] = "You have successfully applied for the job."
          redirect_to @ei_job
        else
          flash[:alert] = "There was an error applying for the job."
          redirect_to @ei_job
        end
    end

    
  private

  def notify_admin_application(application)
    admin_user = EiUser.find_by(role: :ei_admin) # Find the admin user
    return unless admin_user

    # Create a notification for the admin user
    notification = EiNotification.new(
      ei_admin: admin_user,
      ei_user: application.ei_user, # Reference the user who applied
      message: "A new job application has been submitted."
      # Add any other attributes you need for your notification
    )
    notification.save
  end
end
