require 'test_helper'

class NassauLiteraturesControllerTest < ActionController::TestCase
  setup do
    @nassau_literature = nassau_literatures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nassau_literatures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nassau_literature" do
    assert_difference('NassauLiterature.count') do
      post :create, nassau_literature: { classyear: @nassau_literature.classyear, date: @nassau_literature.date, fname: @nassau_literature.fname, issue_no: @nassau_literature.issue_no, lname: @nassau_literature.lname, pages: @nassau_literature.pages, title: @nassau_literature.title }
    end

    assert_redirected_to nassau_literature_path(assigns(:nassau_literature))
  end

  test "should show nassau_literature" do
    get :show, id: @nassau_literature
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nassau_literature
    assert_response :success
  end

  test "should update nassau_literature" do
    patch :update, id: @nassau_literature, nassau_literature: { classyear: @nassau_literature.classyear, date: @nassau_literature.date, fname: @nassau_literature.fname, issue_no: @nassau_literature.issue_no, lname: @nassau_literature.lname, pages: @nassau_literature.pages, title: @nassau_literature.title }
    assert_redirected_to nassau_literature_path(assigns(:nassau_literature))
  end

  test "should destroy nassau_literature" do
    assert_difference('NassauLiterature.count', -1) do
      delete :destroy, id: @nassau_literature
    end

    assert_redirected_to nassau_literatures_path
  end
end
