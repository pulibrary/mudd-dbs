require 'test_helper'

class AlumniControllerTest < ActionController::TestCase
  setup do
    @alumn = alumni(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alumni)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alumn" do
    assert_difference('Alumn.count') do
      post :create, alumn: { box: @alumn.box, class: @alumn.class, fname: @alumn.fname, graduate: @alumn.graduate, lname: @alumn.lname, oversize: @alumn.oversize, photos: @alumn.photos }
    end

    assert_redirected_to alumn_path(assigns(:alumn))
  end

  test "should show alumn" do
    get :show, id: @alumn
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @alumn
    assert_response :success
  end

  test "should update alumn" do
    patch :update, id: @alumn, alumn: { box: @alumn.box, class: @alumn.class, fname: @alumn.fname, graduate: @alumn.graduate, lname: @alumn.lname, oversize: @alumn.oversize, photos: @alumn.photos }
    assert_redirected_to alumn_path(assigns(:alumn))
  end

  test "should destroy alumn" do
    assert_difference('Alumn.count', -1) do
      delete :destroy, id: @alumn
    end

    assert_redirected_to alumni_path
  end
end
