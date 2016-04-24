require 'test_helper'

class RushesControllerTest < ActionController::TestCase
  setup do
    @rush = rushes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rushes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rush" do
    assert_difference('Rush.count') do
      post :create, rush: { name: @rush.name, scheduled_at: @rush.scheduled_at }
    end

    assert_redirected_to rush_path(assigns(:rush))
  end

  test "should show rush" do
    get :show, id: @rush
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rush
    assert_response :success
  end

  test "should update rush" do
    patch :update, id: @rush, rush: { name: @rush.name, scheduled_at: @rush.scheduled_at }
    assert_redirected_to rush_path(assigns(:rush))
  end

  test "should destroy rush" do
    assert_difference('Rush.count', -1) do
      delete :destroy, id: @rush
    end

    assert_redirected_to rushes_path
  end
end
