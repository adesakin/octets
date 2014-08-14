require 'test_helper'

class NetworkDsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:network_ds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create network_d" do
    assert_difference('NetworkD.count') do
      post :create, :network_d => { }
    end

    assert_redirected_to network_d_path(assigns(:network_d))
  end

  test "should show network_d" do
    get :show, :id => network_ds(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => network_ds(:one).to_param
    assert_response :success
  end

  test "should update network_d" do
    put :update, :id => network_ds(:one).to_param, :network_d => { }
    assert_redirected_to network_d_path(assigns(:network_d))
  end

  test "should destroy network_d" do
    assert_difference('NetworkD.count', -1) do
      delete :destroy, :id => network_ds(:one).to_param
    end

    assert_redirected_to network_ds_path
  end
end
