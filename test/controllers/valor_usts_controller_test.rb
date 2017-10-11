require 'test_helper'

class ValorUstsControllerTest < ActionController::TestCase
  setup do
    @valor_ust = valor_usts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:valor_usts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create valor_ust" do
    assert_difference('ValorUst.count') do
      post :create, valor_ust: { fimVigencia: @valor_ust.fimVigencia, inicioVigencia: @valor_ust.inicioVigencia, valor: @valor_ust.valor }
    end

    assert_redirected_to valor_ust_path(assigns(:valor_ust))
  end

  test "should show valor_ust" do
    get :show, id: @valor_ust
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @valor_ust
    assert_response :success
  end

  test "should update valor_ust" do
    patch :update, id: @valor_ust, valor_ust: { fimVigencia: @valor_ust.fimVigencia, inicioVigencia: @valor_ust.inicioVigencia, valor: @valor_ust.valor }
    assert_redirected_to valor_ust_path(assigns(:valor_ust))
  end

  test "should destroy valor_ust" do
    assert_difference('ValorUst.count', -1) do
      delete :destroy, id: @valor_ust
    end

    assert_redirected_to valor_usts_path
  end
end
