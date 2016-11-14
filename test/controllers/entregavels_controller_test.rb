require 'test_helper'

class EntregavelsControllerTest < ActionController::TestCase
  setup do
    @entregavel = entregavels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entregavels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entregavel" do
    assert_difference('Entregavel.count') do
      post :create, entregavel: { ativo: @entregavel.ativo, entregavel: @entregavel.entregavel }
    end

    assert_redirected_to entregavel_path(assigns(:entregavel))
  end

  test "should show entregavel" do
    get :show, id: @entregavel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entregavel
    assert_response :success
  end

  test "should update entregavel" do
    patch :update, id: @entregavel, entregavel: { ativo: @entregavel.ativo, entregavel: @entregavel.entregavel }
    assert_redirected_to entregavel_path(assigns(:entregavel))
  end

  test "should destroy entregavel" do
    assert_difference('Entregavel.count', -1) do
      delete :destroy, id: @entregavel
    end

    assert_redirected_to entregavels_path
  end
end
