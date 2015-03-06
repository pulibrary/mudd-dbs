require 'test_helper'

class ArchboardsControllerTest < ActionController::TestCase
  setup do
    @archboard = archboards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:archboards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create archboard" do
    assert_difference('Archboard.count') do
      post :create, archboard: { board_date: @archboard.board_date, board_dimensions: @archboard.board_dimensions, building_info_sheet: @archboard.building_info_sheet, bw_fiche: @archboard.bw_fiche, color: @archboard.color, comments: @archboard.comments, contractor1_name: @archboard.contractor1_name, contractor1_type: @archboard.contractor1_type, contractor2_name: @archboard.contractor2_name, contractor2_type: @archboard.contractor2_type, contractor3_name: @archboard.contractor3_name, contractor3_type: @archboard.contractor3_type, drawing_number: @archboard.drawing_number, drawing_title: @archboard.drawing_title, drawing_type: @archboard.drawing_type, drawing_view: @archboard.drawing_view, elevation: @archboard.elevation, not_constructed: @archboard.not_constructed, numbers_assigned: @archboard.numbers_assigned, original_assigned: @archboard.original_assigned, project_type: @archboard.project_type, proposal: @archboard.proposal }
    end

    assert_redirected_to archboard_path(assigns(:archboard))
  end

  test "should show archboard" do
    get :show, id: @archboard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @archboard
    assert_response :success
  end

  test "should update archboard" do
    patch :update, id: @archboard, archboard: { board_date: @archboard.board_date, board_dimensions: @archboard.board_dimensions, building_info_sheet: @archboard.building_info_sheet, bw_fiche: @archboard.bw_fiche, color: @archboard.color, comments: @archboard.comments, contractor1_name: @archboard.contractor1_name, contractor1_type: @archboard.contractor1_type, contractor2_name: @archboard.contractor2_name, contractor2_type: @archboard.contractor2_type, contractor3_name: @archboard.contractor3_name, contractor3_type: @archboard.contractor3_type, drawing_number: @archboard.drawing_number, drawing_title: @archboard.drawing_title, drawing_type: @archboard.drawing_type, drawing_view: @archboard.drawing_view, elevation: @archboard.elevation, not_constructed: @archboard.not_constructed, numbers_assigned: @archboard.numbers_assigned, original_assigned: @archboard.original_assigned, project_type: @archboard.project_type, proposal: @archboard.proposal }
    assert_redirected_to archboard_path(assigns(:archboard))
  end

  test "should destroy archboard" do
    assert_difference('Archboard.count', -1) do
      delete :destroy, id: @archboard
    end

    assert_redirected_to archboards_path
  end
end
