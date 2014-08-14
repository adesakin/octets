require 'test_helper'

class NetworkDetailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:network_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create network_detail" do
    assert_difference('NetworkDetail.count') do
      post :create, :network_detail => { }
    end

    assert_redirected_to network_detail_path(assigns(:network_detail))
  end

  test "should show network_detail" do
    get :show, :id => network_details(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => network_details(:one).to_param
    assert_response :success
  end

  test "should update network_detail" do
    put :update, :id => network_details(:one).to_param, :network_detail => { }
    assert_redirected_to network_detail_path(assigns(:network_detail))
  end

  test "should destroy network_detail" do
    assert_difference('NetworkDetail.count', -1) do
      delete :destroy, :id => network_details(:one).to_param
    end

    assert_redirected_to network_details_path
  end
end
