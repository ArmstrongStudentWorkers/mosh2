require 'test_helper'

class HardwareTypesControllerTest < ActionController::TestCase
  setup do
    @hardware_type = hardware_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hardware_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hardware_type" do
    assert_difference('HardwareType.count') do
      post :create, hardware_type: { name: @hardware_type.name }
    end

    assert_redirected_to hardware_type_path(assigns(:hardware_type))
  end

  test "should show hardware_type" do
    get :show, id: @hardware_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hardware_type
    assert_response :success
  end

  test "should update hardware_type" do
    put :update, id: @hardware_type, hardware_type: { name: @hardware_type.name }
    assert_redirected_to hardware_type_path(assigns(:hardware_type))
  end

  test "should destroy hardware_type" do
    assert_difference('HardwareType.count', -1) do
      delete :destroy, id: @hardware_type
    end

    assert_redirected_to hardware_types_path
  end
end
