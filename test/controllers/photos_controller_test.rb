require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  setup do
    @photo = photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo" do
    assert_difference('Photo.count') do
      post :create, photo: { accession_num: @photo.accession_num, box: @photo.box, date_taken: @photo.date_taken, division: @photo.division, e_num: @photo.e_num, general_sub: @photo.general_sub, image_num: @photo.image_num, image_type: @photo.image_type, item_num: @photo.item_num, negative_num: @photo.negative_num, notes: @photo.notes, online_image: @photo.online_image, photographer: @photo.photographer, provenance: @photo.provenance, publication: @photo.publication, specific_sub: @photo.specific_sub, subseries: @photo.subseries }
    end

    assert_redirected_to photo_path(assigns(:photo))
  end

  test "should show photo" do
    get :show, id: @photo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo
    assert_response :success
  end

  test "should update photo" do
    patch :update, id: @photo, photo: { accession_num: @photo.accession_num, box: @photo.box, date_taken: @photo.date_taken, division: @photo.division, e_num: @photo.e_num, general_sub: @photo.general_sub, image_num: @photo.image_num, image_type: @photo.image_type, item_num: @photo.item_num, negative_num: @photo.negative_num, notes: @photo.notes, online_image: @photo.online_image, photographer: @photo.photographer, provenance: @photo.provenance, publication: @photo.publication, specific_sub: @photo.specific_sub, subseries: @photo.subseries }
    assert_redirected_to photo_path(assigns(:photo))
  end

  test "should destroy photo" do
    assert_difference('Photo.count', -1) do
      delete :destroy, id: @photo
    end

    assert_redirected_to photos_path
  end
end
