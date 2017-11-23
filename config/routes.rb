Rails.application.routes.draw do
  resources :valor_usts

  authenticate :user do

    resources :os_tipos, only: [:new, :create, :edit, :update, :destroy]

    resources :os_tarefas do
      collection do
      get 'mostra_nao_pagas'
      get 'mostra_nao_pagas_aprovadas_os'
    end
end

    get '/set_situacao_tarefa' => 'os_tarefas#set_situacao', as: 'set_situacao_tarefa'
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
