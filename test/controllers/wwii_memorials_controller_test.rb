require 'test_helper'

class WwiiMemorialsControllerTest < ActionController::TestCase
  setup do
    @wwii_memorial = wwii_memorials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wwii_memorials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wwii_memorial" do
    assert_difference('WwiiMemorial.count') do
      post :create, wwii_memorial: { access_id: @wwii_memorial.access_id, death_date: @wwii_memorial.death_date, death_year: @wwii_memorial.death_year, last_name: @wwii_memorial.last_name, name: @wwii_memorial.name, place: @wwii_memorial.place, rank: @wwii_memorial.rank, year: @wwii_memorial.year }
    end

    assert_redirected_to wwii_memorial_path(assigns(:wwii_memorial))
  end

  test "should show wwii_memorial" do
    get :show, id: @wwii_memorial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wwii_memorial
    assert_response :success
  end

  test "should update wwii_memorial" do
    patch :update, id: @wwii_memorial, wwii_memorial: { access_id: @wwii_memorial.access_id, death_date: @wwii_memorial.death_date, death_year: @wwii_memorial.death_year, last_name: @wwii_memorial.last_name, name: @wwii_memorial.name, place: @wwii_memorial.place, rank: @wwii_memorial.rank, year: @wwii_memorial.year }
    assert_redirected_to wwii_memorial_path(assigns(:wwii_memorial))
  end

  test "should destroy wwii_memorial" do
    assert_difference('WwiiMemorial.count', -1) do
      delete :destroy, id: @wwii_memorial
    end

    assert_redirected_to wwii_memorials_path
  end
end
