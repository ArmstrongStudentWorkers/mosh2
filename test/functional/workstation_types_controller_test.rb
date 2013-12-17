require 'test_helper'

class WorkstationTypesControllerTest < ActionController::TestCase
  setup do
    @workstation_type = workstation_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workstation_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workstation_type" do
    assert_difference('WorkstationType.count') do
      post :create, workstation_type: { name: @workstation_type.name }
    end

    assert_redirected_to workstation_type_path(assigns(:workstation_type))
  end

  test "should show workstation_type" do
    get :show, id: @workstation_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workstation_type
    assert_response :success
  end

  test "should update workstation_type" do
    put :update, id: @workstation_type, workstation_type: { name: @workstation_type.name }
    assert_redirected_to workstation_type_path(assigns(:workstation_type))
  end

  test "should destroy workstation_type" do
    assert_difference('WorkstationType.count', -1) do
      delete :destroy, id: @workstation_type
    end

    assert_redirected_to workstation_types_path
  end
end
