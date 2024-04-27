require 'test_helper'

class Api::TeachersControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get api_teachers_index_url
    assert_response :success
  end

  test 'should get show' do
    get api_teachers_show_url
    assert_response :success
  end

  test 'should get create' do
    get api_teachers_create_url
    assert_response :success
  end

  test 'should get update' do
    get api_teachers_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get api_teachers_destroy_url
    assert_response :success
  end
end
