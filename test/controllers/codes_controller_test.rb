require 'test_helper'

class CodesControllerTest < ActionController::TestCase
  setup do
    @code = codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create code" do
    assert_difference('Code.count') do
      post :create, code: { text: @code.text }
    end

    assert_redirected_to code_path(assigns(:code))
  end

  test "should show code" do
    get :show, id: @code
    assert_response :success
  end
end
