require 'test_helper'

class MemorialsControllerTest < ActionController::TestCase
  setup do
    @memorial = memorials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:memorials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create memorial" do
    assert_difference('Memorial.count') do
      post :create, memorial: { class_grade: @memorial.class_grade, class_year: @memorial.class_year, no: @memorial.no, page: @memorial.page, publication: @memorial.publication, publish_date: @memorial.publish_date, subject: @memorial.subject, type: @memorial.type, volume: @memorial.volume }
    end

    assert_redirected_to memorial_path(assigns(:memorial))
  end

  test "should show memorial" do
    get :show, id: @memorial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @memorial
    assert_response :success
  end

  test "should update memorial" do
    patch :update, id: @memorial, memorial: { class_grade: @memorial.class_grade, class_year: @memorial.class_year, no: @memorial.no, page: @memorial.page, publication: @memorial.publication, publish_date: @memorial.publish_date, subject: @memorial.subject, type: @memorial.type, volume: @memorial.volume }
    assert_redirected_to memorial_path(assigns(:memorial))
  end

  test "should destroy memorial" do
    assert_difference('Memorial.count', -1) do
      delete :destroy, id: @memorial
    end

    assert_redirected_to memorials_path
  end
end
