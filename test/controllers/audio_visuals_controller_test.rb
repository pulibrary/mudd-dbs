require 'test_helper'

class AudioVisualsControllerTest < ActionController::TestCase
  setup do
    @audio_visual = audio_visuals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:audio_visuals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create audio_visual" do
    assert_difference('AudioVisual.count') do
      post :create, audio_visual: { box: @audio_visual.box, color: @audio_visual.color, copied: @audio_visual.copied, creator: @audio_visual.creator, duration: @audio_visual.duration, format: @audio_visual.format, id3: @audio_visual.id3, index: @audio_visual.index, item: @audio_visual.item, notes: @audio_visual.notes, title: @audio_visual.title, topic: @audio_visual.topic, year: @audio_visual.year }
    end

    assert_redirected_to audio_visual_path(assigns(:audio_visual))
  end

  test "should show audio_visual" do
    get :show, id: @audio_visual
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @audio_visual
    assert_response :success
  end

  test "should update audio_visual" do
    patch :update, id: @audio_visual, audio_visual: { box: @audio_visual.box, color: @audio_visual.color, copied: @audio_visual.copied, creator: @audio_visual.creator, duration: @audio_visual.duration, format: @audio_visual.format, id3: @audio_visual.id3, index: @audio_visual.index, item: @audio_visual.item, notes: @audio_visual.notes, title: @audio_visual.title, topic: @audio_visual.topic, year: @audio_visual.year }
    assert_redirected_to audio_visual_path(assigns(:audio_visual))
  end

  test "should destroy audio_visual" do
    assert_difference('AudioVisual.count', -1) do
      delete :destroy, id: @audio_visual
    end

    assert_redirected_to audio_visuals_path
  end
end
