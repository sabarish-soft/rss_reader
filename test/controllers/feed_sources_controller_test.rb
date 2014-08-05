require 'test_helper'

class FeedSourcesControllerTest < ActionController::TestCase
  setup do
    @feed_source = feed_sources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feed_sources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feed_source" do
    assert_difference('FeedSource.count') do
      post :create, feed_source: { name: @feed_source.name, url: @feed_source.url }
    end

    assert_redirected_to feed_source_path(assigns(:feed_source))
  end

  test "should show feed_source" do
    get :show, id: @feed_source
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feed_source
    assert_response :success
  end

  test "should update feed_source" do
    patch :update, id: @feed_source, feed_source: { name: @feed_source.name, url: @feed_source.url }
    assert_redirected_to feed_source_path(assigns(:feed_source))
  end

  test "should destroy feed_source" do
    assert_difference('FeedSource.count', -1) do
      delete :destroy, id: @feed_source
    end

    assert_redirected_to feed_sources_path
  end
end
