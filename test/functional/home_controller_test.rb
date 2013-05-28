require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get _sidebar" do
    get :_sidebar
    assert_response :success
  end

  test "should get error_page" do
    get :error_page
    assert_response :success
  end

end
