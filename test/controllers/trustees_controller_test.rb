require 'test_helper'

class TrusteesControllerTest < ActionController::TestCase
  setup do
    @trustee = trustees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trustees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trustee" do
    assert_difference('Trustee.count') do
      post :create, trustee: { access_id: @trustee.access_id, dates_of_service: @trustee.dates_of_service, first_year: @trustee.first_year, full_name: @trustee.full_name, trustee_type: @trustee.trustee_type, university_status: @trustee.university_status }
    end

    assert_redirected_to trustee_path(assigns(:trustee))
  end

  test "should show trustee" do
    get :show, id: @trustee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trustee
    assert_response :success
  end

  test "should update trustee" do
    patch :update, id: @trustee, trustee: { access_id: @trustee.access_id, dates_of_service: @trustee.dates_of_service, first_year: @trustee.first_year, full_name: @trustee.full_name, trustee_type: @trustee.trustee_type, university_status: @trustee.university_status }
    assert_redirected_to trustee_path(assigns(:trustee))
  end

  test "should destroy trustee" do
    assert_difference('Trustee.count', -1) do
      delete :destroy, id: @trustee
    end

    assert_redirected_to trustees_path
  end
end
