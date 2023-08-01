require "test_helper"

class NestedFormsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get nested_forms_destroy_url
    assert_response :success
  end
end
