require "test_helper"

class EiApplicationsControllerTest < ActionDispatch::IntegrationTest
  #Para integrar métodos de devise como sign_in
  include Devise::Test::IntegrationHelpers

  #Configuración para el testeo
  setup do
    @ei_job = ei_jobs(:one)
    @ei_user = ei_users(:one)

    sign_in @ei_user
  
  end


  test "create ei_application" do
    assert_difference("EiApplication.count") do
      post ei_job_ei_applications_url(@ei_job), params: {
        ei_application: { application_message: "More info" },
      }
    end

    assert_redirected_to ei_job_url(@ei_job)
  end

  
end
