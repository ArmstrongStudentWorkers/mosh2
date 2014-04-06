require 'test_helper'

class StudentEventsControllerTest < ActionController::TestCase
  setup do
    @student_event = student_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_event" do
    assert_difference('StudentEvent.count') do
      post :create, student_event: { description: @student_event.description, end_date: @student_event.end_date, name: @student_event.name, start_date: @student_event.start_date }
    end

    assert_redirected_to student_event_path(assigns(:student_event))
  end

  test "should show student_event" do
    get :show, id: @student_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_event
    assert_response :success
  end

  test "should update student_event" do
    put :update, id: @student_event, student_event: { description: @student_event.description, end_date: @student_event.end_date, name: @student_event.name, start_date: @student_event.start_date }
    assert_redirected_to student_event_path(assigns(:student_event))
  end

  test "should destroy student_event" do
    assert_difference('StudentEvent.count', -1) do
      delete :destroy, id: @student_event
    end

    assert_redirected_to student_events_path
  end
end
