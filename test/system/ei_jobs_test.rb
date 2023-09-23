require "application_system_test_case"

class EiJobsTest < ApplicationSystemTestCase
  setup do
    @ei_job = ei_jobs(:one)
  end

  test "visiting the index" do
    visit ei_jobs_url
    assert_selector "h1", text: "Ei jobs"
  end

  test "should create ei job" do
    visit ei_jobs_url
    click_on "New ei job"

    fill_in "Deadline", with: @ei_job.deadline
    fill_in "Ei user", with: @ei_job.ei_user_id
    fill_in "Job description", with: @ei_job.job_description
    fill_in "Position", with: @ei_job.position
    fill_in "Salary", with: @ei_job.salary
    click_on "Create Ei job"

    assert_text "Ei job was successfully created"
    click_on "Back"
  end

  test "should update Ei job" do
    visit ei_job_url(@ei_job)
    click_on "Edit this ei job", match: :first

    fill_in "Deadline", with: @ei_job.deadline
    fill_in "Ei user", with: @ei_job.ei_user_id
    fill_in "Job description", with: @ei_job.job_description
    fill_in "Position", with: @ei_job.position
    fill_in "Salary", with: @ei_job.salary
    click_on "Update Ei job"

    assert_text "Ei job was successfully updated"
    click_on "Back"
  end

  test "should destroy Ei job" do
    visit ei_job_url(@ei_job)
    click_on "Destroy this ei job", match: :first

    assert_text "Ei job was successfully destroyed"
  end
end
