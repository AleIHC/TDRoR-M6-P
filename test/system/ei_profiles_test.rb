require "application_system_test_case"

class EiProfilesTest < ApplicationSystemTestCase
  setup do
    @ei_profile = ei_profiles(:one)
  end

  test "visiting the index" do
    visit ei_profiles_url
    assert_selector "h1", text: "Ei profiles"
  end

  test "should create ei profile" do
    visit ei_profiles_url
    click_on "New ei profile"

    fill_in "Current position", with: @ei_profile.current_position
    fill_in "Ei user", with: @ei_profile.ei_user_id
    fill_in "Email", with: @ei_profile.email
    fill_in "First name", with: @ei_profile.first_name
    fill_in "Last name", with: @ei_profile.last_name
    fill_in "Phone number", with: @ei_profile.phone_number
    fill_in "Profile picture", with: @ei_profile.profile_picture
    fill_in "Work start date", with: @ei_profile.work_start_date
    click_on "Create Ei profile"

    assert_text "Ei profile was successfully created"
    click_on "Back"
  end

  test "should update Ei profile" do
    visit ei_profile_url(@ei_profile)
    click_on "Edit this ei profile", match: :first

    fill_in "Current position", with: @ei_profile.current_position
    fill_in "Ei user", with: @ei_profile.ei_user_id
    fill_in "Email", with: @ei_profile.email
    fill_in "First name", with: @ei_profile.first_name
    fill_in "Last name", with: @ei_profile.last_name
    fill_in "Phone number", with: @ei_profile.phone_number
    fill_in "Profile picture", with: @ei_profile.profile_picture
    fill_in "Work start date", with: @ei_profile.work_start_date
    click_on "Update Ei profile"

    assert_text "Ei profile was successfully updated"
    click_on "Back"
  end

  test "should destroy Ei profile" do
    visit ei_profile_url(@ei_profile)
    click_on "Destroy this ei profile", match: :first

    assert_text "Ei profile was successfully destroyed"
  end
end
