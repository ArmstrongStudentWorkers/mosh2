require 'test_helper'

class PosterStatusesControllerTest < ActionController::TestCase
  setup do
    @poster_status = poster_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:poster_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poster_status" do
    assert_difference('PosterStatus.count') do
      post :create, poster_status: { name: @poster_status.name }
    end

    assert_redirected_to poster_status_path(assigns(:poster_status))
  end

  test "should show poster_status" do
    get :show, id: @poster_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @poster_status
    assert_response :success
  end

  test "should update poster_status" do
    put :update, id: @poster_status, poster_status: { name: @poster_status.name }
    assert_redirected_to poster_status_path(assigns(:poster_status))
  end

  test "should destroy poster_status" do
    assert_difference('PosterStatus.count', -1) do
      delete :destroy, id: @poster_status
    end

    assert_redirected_to poster_statuses_path
  end
end
