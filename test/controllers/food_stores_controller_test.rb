require 'test_helper'

class FoodStoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get food_stores_index_url
    assert_response :success
  end

end
