# frozen_string_literal: true

require 'test_helper'

class Eatery::ProperStocksControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get eatery_proper_stocks_index_url
    assert_response :success
  end

  test 'should get create' do
    get eatery_proper_stocks_create_url
    assert_response :success
  end

  test 'should get update' do
    get eatery_proper_stocks_update_url
    assert_response :success
  end
end
