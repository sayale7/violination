require 'test_helper'

class TagNamesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => TagName.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    TagName.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    TagName.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to tag_name_url(assigns(:tag_name))
  end
  
  def test_edit
    get :edit, :id => TagName.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    TagName.any_instance.stubs(:valid?).returns(false)
    put :update, :id => TagName.first
    assert_template 'edit'
  end
  
  def test_update_valid
    TagName.any_instance.stubs(:valid?).returns(true)
    put :update, :id => TagName.first
    assert_redirected_to tag_name_url(assigns(:tag_name))
  end
  
  def test_destroy
    tag_name = TagName.first
    delete :destroy, :id => tag_name
    assert_redirected_to tag_names_url
    assert !TagName.exists?(tag_name.id)
  end
end
