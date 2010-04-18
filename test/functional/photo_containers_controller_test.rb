require 'test_helper'

class PhotoContainersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => PhotoContainer.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    PhotoContainer.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    PhotoContainer.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to photo_container_url(assigns(:photo_container))
  end
  
  def test_edit
    get :edit, :id => PhotoContainer.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    PhotoContainer.any_instance.stubs(:valid?).returns(false)
    put :update, :id => PhotoContainer.first
    assert_template 'edit'
  end
  
  def test_update_valid
    PhotoContainer.any_instance.stubs(:valid?).returns(true)
    put :update, :id => PhotoContainer.first
    assert_redirected_to photo_container_url(assigns(:photo_container))
  end
  
  def test_destroy
    photo_container = PhotoContainer.first
    delete :destroy, :id => photo_container
    assert_redirected_to photo_containers_url
    assert !PhotoContainer.exists?(photo_container.id)
  end
end
