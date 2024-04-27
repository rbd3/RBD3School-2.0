require 'test_helper'

class Api::SubjectsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get api_subjects_index_url
    assert_response :success
  end

  test 'should get show' do
    get api_subjects_show_url
    assert_response :success
  end

  test 'should get create' do
    get api_subjects_create_url
    assert_response :success
  end

  test 'should get update' do
    get api_subjects_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get api_subjects_destroy_url
    assert_response :success
  end
end
