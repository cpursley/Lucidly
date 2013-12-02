require 'test_helper'

class DreamsControllerTest < ActionController::TestCase
  setup do
    @dream = dreams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dreams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dream" do
    assert_difference('Dream.count') do
      post :create, dream: { accepted: @dream.accepted, body: @dream.body, changelog: @dream.changelog, freezebody: @dream.freezebody, message: @dream.message, state: @dream.state, submitted: @dream.submitted, teaser: @dream.teaser, title: @dream.title, user_id: @dream.user_id, version: @dream.version }
    end

    assert_redirected_to dream_path(assigns(:dream))
  end

  test "should show dream" do
    get :show, id: @dream
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dream
    assert_response :success
  end

  test "should update dream" do
    put :update, id: @dream, dream: { accepted: @dream.accepted, body: @dream.body, changelog: @dream.changelog, freezebody: @dream.freezebody, message: @dream.message, state: @dream.state, submitted: @dream.submitted, teaser: @dream.teaser, title: @dream.title, user_id: @dream.user_id, version: @dream.version }
    assert_redirected_to dream_path(assigns(:dream))
  end

  test "should destroy dream" do
    assert_difference('Dream.count', -1) do
      delete :destroy, id: @dream
    end

    assert_redirected_to dreams_path
  end
end
