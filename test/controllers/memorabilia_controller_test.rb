require 'test_helper'

class MemorabiliaControllerTest < ActionController::TestCase
  setup do
    @memorabilium = memorabilia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:memorabilia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create memorabilium" do
    assert_difference('Memorabilium.count') do
      post :create, memorabilium: { box: @memorabilium.box, category: @memorabilium.category, classyear: @memorabilium.classyear, description: @memorabilium.description, provenance: @memorabilium.provenance, reunion: @memorabilium.reunion, year: @memorabilium.year }
    end

    assert_redirected_to memorabilium_path(assigns(:memorabilium))
  end

  test "should show memorabilium" do
    get :show, id: @memorabilium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @memorabilium
    assert_response :success
  end

  test "should update memorabilium" do
    patch :update, id: @memorabilium, memorabilium: { box: @memorabilium.box, category: @memorabilium.category, classyear: @memorabilium.classyear, description: @memorabilium.description, provenance: @memorabilium.provenance, reunion: @memorabilium.reunion, year: @memorabilium.year }
    assert_redirected_to memorabilium_path(assigns(:memorabilium))
  end

  test "should destroy memorabilium" do
    assert_difference('Memorabilium.count', -1) do
      delete :destroy, id: @memorabilium
    end

    assert_redirected_to memorabilia_path
  end
end
