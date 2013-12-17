require 'test_helper'

class HardwaresControllerTest < ActionController::TestCase
  setup do
    @hardware = hardwares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hardwares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hardware" do
    assert_difference('Hardware.count') do
      post :create, hardware: { aasu_number: @hardware.aasu_number, assigned_to: @hardware.assigned_to, hardware_status_comment: @hardware.hardware_status_comment, hardware_status_id: @hardware.hardware_status_id, hardware_type_id: @hardware.hardware_type_id, manufacturer: @hardware.manufacturer, model_number: @hardware.model_number, name: @hardware.name, serial_number: @hardware.serial_number, specs: @hardware.specs, workstation_id: @hardware.workstation_id }
    end

    assert_redirected_to hardware_path(assigns(:hardware))
  end

  test "should show hardware" do
    get :show, id: @hardware
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hardware
    assert_response :success
  end

  test "should update hardware" do
    put :update, id: @hardware, hardware: { aasu_number: @hardware.aasu_number, assigned_to: @hardware.assigned_to, hardware_status_comment: @hardware.hardware_status_comment, hardware_status_id: @hardware.hardware_status_id, hardware_type_id: @hardware.hardware_type_id, manufacturer: @hardware.manufacturer, model_number: @hardware.model_number, name: @hardware.name, serial_number: @hardware.serial_number, specs: @hardware.specs, workstation_id: @hardware.workstation_id }
    assert_redirected_to hardware_path(assigns(:hardware))
  end

  test "should destroy hardware" do
    assert_difference('Hardware.count', -1) do
      delete :destroy, id: @hardware
    end

    assert_redirected_to hardwares_path
  end
end
