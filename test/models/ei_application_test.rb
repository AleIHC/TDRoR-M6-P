require "test_helper"

class EiApplicationTest < ActiveSupport::TestCase
  def setup
    @ei_application = ei_applications(:ei_application_one)
  end

  test "should be valid" do
    assert @ei_application.valid?
  end

  test "should have an associated user" do
    assert_not_nil @ei_application.ei_user
  end

  test "should have an associated job" do
    assert_not_nil @ei_application.ei_job
  end
end
