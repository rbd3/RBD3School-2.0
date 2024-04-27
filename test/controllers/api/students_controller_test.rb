require "test_helper"

class Api::StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_students_index_url
    assert_response :success
  end

  test "should get show" do
    get api_students_show_url
    assert_response :success
  end

  test "should get create" do
    get api_students_create_url
    assert_response :success
  end

  test "should get update" do
    get api_students_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_students_destroy_url
    assert_response :success
  end
end
