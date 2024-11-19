# frozen_string_literal: true

require 'test_helper'

class SalesManagementControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get sales_management_index_url
    assert_response :success
  end
end
