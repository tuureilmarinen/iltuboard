require 'test_helper'

class BansControllerTest < ActionController::TestCase
  setup do
    @ban = bans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ban" do
    assert_difference('Ban.count') do
      post :create, ban: { ends_at: @ban.ends_at, post_id: @ban.post_id, reason: @ban.reason, user_id: @ban.user_id }
    end

    assert_redirected_to ban_path(assigns(:ban))
  end

  test "should show ban" do
    get :show, id: @ban
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ban
    assert_response :success
  end

  test "should update ban" do
    patch :update, id: @ban, ban: { ends_at: @ban.ends_at, post_id: @ban.post_id, reason: @ban.reason, user_id: @ban.user_id }
    assert_redirected_to ban_path(assigns(:ban))
  end

  test "should destroy ban" do
    assert_difference('Ban.count', -1) do
      delete :destroy, id: @ban
    end

    assert_redirected_to bans_path
  end
end
