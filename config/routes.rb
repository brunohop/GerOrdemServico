Rails.application.routes.draw do
  authenticate :user do

    resources :os_tipos, only: [:new, :create, :edit, :update, :destroy]

    resources :os_tarefas

    resources :tarefa_deb_tecnicos

    resources :projetos

    resources :produtos

    resources :pessoas

    resources :os_nivel_servicos

    resources :os_entregavels

    resources :os_deb_tecnicos

    resources :ordem_servicos

    resources :entregavels

    resources :debito_tecnicos

    resources :catalogos

  end

  devise_for :users do
    delete '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :models


  root to: 'visitors#index'

  match 'imprimir', controller: 'ordem_servicos', action: 'imprimir', via: 'get'
  match 'clonar', controller: 'ordem_servicos', action: 'clone', via: 'get'
  match 'laudo', controller: 'laudos', action: 'laudo', via: 'get'


end
