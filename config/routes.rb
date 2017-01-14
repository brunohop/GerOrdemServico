Rails.application.routes.draw do
  resources :os_tipos

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

  devise_for :users
  devise_for :models


  root to: 'visitors#index'

  match 'imprimir', controller: 'ordem_servicos', action: 'imprimir', via: 'get'
  match 'laudo', controller: 'laudos', action: 'laudo', via: 'get'


end
