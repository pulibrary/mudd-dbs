require 'test_helper'

class HonorariesControllerTest < ActionController::TestCase
  setup do
    @honorary = honoraries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:honoraries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create honorary" do
    assert_difference('Honorary.count') do
      post :create, honorary: { death: @honorary.death, degree: @honorary.degree, file: @honorary.file, fname: @honorary.fname, lname: @honorary.lname, year: @honorary.year }
    end

    assert_redirected_to honorary_path(assigns(:honorary))
  end

  test "should show honorary" do
    get :show, id: @honorary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @honorary
    assert_response :success
  end

  test "should update honorary" do
    patch :update, id: @honorary, honorary: { death: @honorary.death, degree: @honorary.degree, file: @honorary.file, fname: @honorary.fname, lname: @honorary.lname, year: @honorary.year }
    assert_redirected_to honorary_path(assigns(:honorary))
  end

  test "should destroy honorary" do
    assert_difference('Honorary.count', -1) do
      delete :destroy, id: @honorary
    end

    assert_redirected_to honoraries_path
  end
end
