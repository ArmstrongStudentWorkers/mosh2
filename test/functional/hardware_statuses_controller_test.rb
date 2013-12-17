require 'test_helper'

class HardwareStatusesControllerTest < ActionController::TestCase
  setup do
    @hardware_status = hardware_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hardware_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hardware_status" do
    assert_difference('HardwareStatus.count') do
      post :create, hardware_status: { name: @hardware_status.name }
    end

    assert_redirected_to hardware_status_path(assigns(:hardware_status))
  end

  test "should show hardware_status" do
    get :show, id: @hardware_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hardware_status
    assert_response :success
  end

  test "should update hardware_status" do
    put :update, id: @hardware_status, hardware_status: { name: @hardware_status.name }
    assert_redirected_to hardware_status_path(assigns(:hardware_status))
  end

  test "should destroy hardware_status" do
    assert_difference('HardwareStatus.count', -1) do
      delete :destroy, id: @hardware_status
    end

    assert_redirected_to hardware_statuses_path
  end
end
