require 'test_helper'

class BloodGlucosesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get blood_glucoses_show_url
    assert_response :success
  end

end
