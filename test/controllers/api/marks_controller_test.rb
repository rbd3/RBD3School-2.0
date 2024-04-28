require 'test_helper'

class Api::MarksControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get api_marks_index_url
    assert_response :success
  end

  test 'should get show' do
    get api_marks_show_url
    assert_response :success
  end

  test 'should get create' do
    get api_marks_create_url
    assert_response :success
  end

  test 'should get update' do
    get api_marks_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get api_marks_destroy_url
    assert_response :success
  end
end
