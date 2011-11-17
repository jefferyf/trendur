require 'test_helper'

class Admin::TwitterListsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => TwitterList.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    TwitterList.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    TwitterList.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_twitter_list_url(assigns(:twitter_list))
  end

  def test_edit
    get :edit, :id => TwitterList.first
    assert_template 'edit'
  end

  def test_update_invalid
    TwitterList.any_instance.stubs(:valid?).returns(false)
    put :update, :id => TwitterList.first
    assert_template 'edit'
  end

  def test_update_valid
    TwitterList.any_instance.stubs(:valid?).returns(true)
    put :update, :id => TwitterList.first
    assert_redirected_to admin_twitter_list_url(assigns(:twitter_list))
  end

  def test_destroy
    twitter_list = TwitterList.first
    delete :destroy, :id => twitter_list
    assert_redirected_to admin_twitter_lists_url
    assert !TwitterList.exists?(twitter_list.id)
  end
end
