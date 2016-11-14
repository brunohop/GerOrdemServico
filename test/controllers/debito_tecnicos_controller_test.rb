require 'test_helper'

class DebitoTecnicosControllerTest < ActionController::TestCase
  setup do
    @debito_tecnico = debito_tecnicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:debito_tecnicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create debito_tecnico" do
    assert_difference('DebitoTecnico.count') do
      post :create, debito_tecnico: { debito_tecnico: @debito_tecnico.debito_tecnico }
    end

    assert_redirected_to debito_tecnico_path(assigns(:debito_tecnico))
  end

  test "should show debito_tecnico" do
    get :show, id: @debito_tecnico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @debito_tecnico
    assert_response :success
  end

  test "should update debito_tecnico" do
    patch :update, id: @debito_tecnico, debito_tecnico: { debito_tecnico: @debito_tecnico.debito_tecnico }
    assert_redirected_to debito_tecnico_path(assigns(:debito_tecnico))
  end

  test "should destroy debito_tecnico" do
    assert_difference('DebitoTecnico.count', -1) do
      delete :destroy, id: @debito_tecnico
    end

    assert_redirected_to debito_tecnicos_path
  end
end
