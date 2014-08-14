require 'test_helper'

class CollectionAttributesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collection_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create collection_attribute" do
    assert_difference('CollectionAttribute.count') do
      post :create, :collection_attribute => { }
    end

    assert_redirected_to collection_attribute_path(assigns(:collection_attribute))
  end

  test "should show collection_attribute" do
    get :show, :id => collection_attributes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => collection_attributes(:one).to_param
    assert_response :success
  end

  test "should update collection_attribute" do
    put :update, :id => collection_attributes(:one).to_param, :collection_attribute => { }
    assert_redirected_to collection_attribute_path(assigns(:collection_attribute))
  end

  test "should destroy collection_attribute" do
    assert_difference('CollectionAttribute.count', -1) do
      delete :destroy, :id => collection_attributes(:one).to_param
    end

    assert_redirected_to collection_attributes_path
  end
end
