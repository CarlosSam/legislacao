require 'test_helper'

class Adm::PoliticiansControllerTest < ActionController::TestCase
  setup do
    @adm_politician = adm_politicians(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adm_politicians)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create adm_politician" do
    assert_difference('Adm::Politician.count') do
      post :create, adm_politician: { email: @adm_politician.email, name: @adm_politician.name, number: @adm_politician.number, party: @adm_politician.party }
    end

    assert_redirected_to adm_politician_path(assigns(:adm_politician))
  end

  test "should show adm_politician" do
    get :show, id: @adm_politician
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @adm_politician
    assert_response :success
  end

  test "should update adm_politician" do
    patch :update, id: @adm_politician, adm_politician: { email: @adm_politician.email, name: @adm_politician.name, number: @adm_politician.number, party: @adm_politician.party }
    assert_redirected_to adm_politician_path(assigns(:adm_politician))
  end

  test "should destroy adm_politician" do
    assert_difference('Adm::Politician.count', -1) do
      delete :destroy, id: @adm_politician
    end

    assert_redirected_to adm_politicians_path
  end
end
