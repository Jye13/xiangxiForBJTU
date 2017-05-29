require 'test_helper'

class RiderorderControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get riderorder_new_url
    assert_response :success
  end

  test "should get create" do
    get riderorder_create_url
    assert_response :success
  end

end
