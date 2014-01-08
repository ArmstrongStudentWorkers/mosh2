require 'test_helper'

class AfterHoursAccessesControllerTest < ActionController::TestCase
  setup do
    @after_hours_access = after_hours_accesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:after_hours_accesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create after_hours_access" do
    assert_difference('AfterHoursAccess.count') do
      post :create, after_hours_access: { first_name: @after_hours_access.first_name, last_name: @after_hours_access.last_name, location_id: @after_hours_access.location_id, semester_id: @after_hours_access.semester_id, sid: @after_hours_access.sid, user_id: @after_hours_access.user_id }
    end

    assert_redirected_to after_hours_access_path(assigns(:after_hours_access))
  end

  test "should show after_hours_access" do
    get :show, id: @after_hours_access
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @after_hours_access
    assert_response :success
  end

  test "should update after_hours_access" do
    put :update, id: @after_hours_access, after_hours_access: { first_name: @after_hours_access.first_name, last_name: @after_hours_access.last_name, location_id: @after_hours_access.location_id, semester_id: @after_hours_access.semester_id, sid: @after_hours_access.sid, user_id: @after_hours_access.user_id }
    assert_redirected_to after_hours_access_path(assigns(:after_hours_access))
  end

  test "should destroy after_hours_access" do
    assert_difference('AfterHoursAccess.count', -1) do
      delete :destroy, id: @after_hours_access
    end

    assert_redirected_to after_hours_accesses_path
  end
end
