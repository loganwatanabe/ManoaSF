require 'test_helper'

class YummyTummyDayOrdersControllerTest < ActionController::TestCase
  setup do
    @yummy_tummy_day_order = yummy_tummy_day_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yummy_tummy_day_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yummy_tummy_day_order" do
    assert_difference('YummyTummyDayOrder.count') do
      post :create, yummy_tummy_day_order: { participant_id: @yummy_tummy_day_order.participant_id, total_cost: @yummy_tummy_day_order.total_cost }
    end

    assert_redirected_to yummy_tummy_day_order_path(assigns(:yummy_tummy_day_order))
  end

  test "should show yummy_tummy_day_order" do
    get :show, id: @yummy_tummy_day_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yummy_tummy_day_order
    assert_response :success
  end

  test "should update yummy_tummy_day_order" do
    put :update, id: @yummy_tummy_day_order, yummy_tummy_day_order: { participant_id: @yummy_tummy_day_order.participant_id, total_cost: @yummy_tummy_day_order.total_cost }
    assert_redirected_to yummy_tummy_day_order_path(assigns(:yummy_tummy_day_order))
  end

  test "should destroy yummy_tummy_day_order" do
    assert_difference('YummyTummyDayOrder.count', -1) do
      delete :destroy, id: @yummy_tummy_day_order
    end

    assert_redirected_to yummy_tummy_day_orders_path
  end
end
