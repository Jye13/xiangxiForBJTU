require 'test_helper'

class OrderstationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get orderstation_new_url
    assert_response :success
  end

  test "should get create" do
    get orderstation_create_url
    assert_response :success
  end

end
