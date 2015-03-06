require 'test_helper'

class NewAlumniControllerTest < ActionController::TestCase
  setup do
    @new_alumn = new_alumni(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:new_alumni)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create new_alumn" do
    assert_difference('NewAlumn.count') do
      post :create, new_alumn: { academicfile: @new_alumn.academicfile, fname: @new_alumn.fname, lname: @new_alumn.lname, pubfile: @new_alumn.pubfile, year: @new_alumn.year }
    end

    assert_redirected_to new_alumn_path(assigns(:new_alumn))
  end

  test "should show new_alumn" do
    get :show, id: @new_alumn
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @new_alumn
    assert_response :success
  end

  test "should update new_alumn" do
    patch :update, id: @new_alumn, new_alumn: { academicfile: @new_alumn.academicfile, fname: @new_alumn.fname, lname: @new_alumn.lname, pubfile: @new_alumn.pubfile, year: @new_alumn.year }
    assert_redirected_to new_alumn_path(assigns(:new_alumn))
  end

  test "should destroy new_alumn" do
    assert_difference('NewAlumn.count', -1) do
      delete :destroy, id: @new_alumn
    end

    assert_redirected_to new_alumni_path
  end
end
