require 'test_helper'

class TrusteesMinutesControllerTest < ActionController::TestCase
  setup do
    @trustees_minute = trustees_minutes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trustees_minutes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trustees_minute" do
    assert_difference('TrusteesMinute.count') do
      post :create, trustees_minute: { access_id: @trustees_minute.access_id, page: @trustees_minute.page, subject: @trustees_minute.subject, volume: @trustees_minute.volume }
    end

    assert_redirected_to trustees_minute_path(assigns(:trustees_minute))
  end

  test "should show trustees_minute" do
    get :show, id: @trustees_minute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trustees_minute
    assert_response :success
  end

  test "should update trustees_minute" do
    patch :update, id: @trustees_minute, trustees_minute: { access_id: @trustees_minute.access_id, page: @trustees_minute.page, subject: @trustees_minute.subject, volume: @trustees_minute.volume }
    assert_redirected_to trustees_minute_path(assigns(:trustees_minute))
  end

  test "should destroy trustees_minute" do
    assert_difference('TrusteesMinute.count', -1) do
      delete :destroy, id: @trustees_minute
    end

    assert_redirected_to trustees_minutes_path
  end
end
