require 'test_helper'

class Eatery::OrderStocksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get eatery_order_stocks_index_url
    assert_response :success
  end

  test "should get create" do
    get eatery_order_stocks_create_url
    assert_response :success
  end

  test "should get update" do
    get eatery_order_stocks_update_url
    assert_response :success
  end

end
