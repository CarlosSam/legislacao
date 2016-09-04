require 'test_helper'

class Adm::PoliticiansControllerTest < ActionController::TestCase
  setup do
    @politician = politicians(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:politicians)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create politician" do
    assert_difference('Adm::Politician.count') do
      post :create, politician: { email: @politician.email, name: @politician.name, number: @politician.number, party: @politician.party }
    end

    assert_redirected_to politician_path(assigns(:politician))
  end

  test "should show politician" do
    get :show, id: @politician
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @politician
    assert_response :success
  end

  test "should update politician" do
    patch :update, id: @politician, politician: { email: @politician.email, name: @politician.name, number: @politician.number, party: @politician.party }
    assert_redirected_to politician_path(assigns(:politician))
  end

  test "should destroy politician" do
    assert_difference('Adm::Politician.count', -1) do
      delete :destroy, id: @politician
    end

    assert_redirected_to politicians_path
  end
end
