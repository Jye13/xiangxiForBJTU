require 'test_helper'

class CategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get getCategory" do
    get category_getCategory_url
    assert_response :success
  end

end
