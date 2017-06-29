require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get indexg" do
    get main_indexg_url
    assert_response :success
  end

end
