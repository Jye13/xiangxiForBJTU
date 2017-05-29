require 'test_helper'

class LogControllerTest < ActionDispatch::IntegrationTest
  test "should get getLogs" do
    get log_getLogs_url
    assert_response :success
  end

end
