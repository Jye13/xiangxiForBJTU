require 'test_helper'

class PictureControllerTest < ActionDispatch::IntegrationTest
  test "should get upload" do
    get picture_upload_url
    assert_response :success
  end

  test "should get tak" do
    get picture_tak_url
    assert_response :success
  end

end
