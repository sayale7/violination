require 'test_helper'

class SitetextsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Sitetext.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Sitetext.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Sitetext.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to sitetext_url(assigns(:sitetext))
  end
  
  def test_edit
    get :edit, :id => Sitetext.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Sitetext.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Sitetext.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Sitetext.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Sitetext.first
    assert_redirected_to sitetext_url(assigns(:sitetext))
  end
  
  def test_destroy
    sitetext = Sitetext.first
    delete :destroy, :id => sitetext
    assert_redirected_to sitetexts_url
    assert !Sitetext.exists?(sitetext.id)
  end
end
