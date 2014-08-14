require 'test_helper'

class NetworkAllocationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:network_allocations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create network_allocation" do
    assert_difference('NetworkAllocation.count') do
      post :create, :network_allocation => { }
    end

    assert_redirected_to network_allocation_path(assigns(:network_allocation))
  end

  test "should show network_allocation" do
    get :show, :id => network_allocations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => network_allocations(:one).to_param
    assert_response :success
  end

  test "should update network_allocation" do
    put :update, :id => network_allocations(:one).to_param, :network_allocation => { }
    assert_redirected_to network_allocation_path(assigns(:network_allocation))
  end

  test "should destroy network_allocation" do
    assert_difference('NetworkAllocation.count', -1) do
      delete :destroy, :id => network_allocations(:one).to_param
    end

    assert_redirected_to network_allocations_path
  end
end
