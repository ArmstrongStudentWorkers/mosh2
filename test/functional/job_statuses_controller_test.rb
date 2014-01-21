require 'test_helper'

class JobStatusesControllerTest < ActionController::TestCase
  setup do
    @job_status = job_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_status" do
    assert_difference('JobStatus.count') do
      post :create, job_status: { name: @job_status.name }
    end

    assert_redirected_to job_status_path(assigns(:job_status))
  end

  test "should show job_status" do
    get :show, id: @job_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_status
    assert_response :success
  end

  test "should update job_status" do
    put :update, id: @job_status, job_status: { name: @job_status.name }
    assert_redirected_to job_status_path(assigns(:job_status))
  end

  test "should destroy job_status" do
    assert_difference('JobStatus.count', -1) do
      delete :destroy, id: @job_status
    end

    assert_redirected_to job_statuses_path
  end
end
