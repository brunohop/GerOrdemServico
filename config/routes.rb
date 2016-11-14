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

  match 'iniciaBuscaEmpresa', controller: 'empresas', action: 'initBusca', via: 'get'

  match 'buscarEmpresa', controller: 'empresas', action: 'busca', via: 'get'

  match 'iniciaBuscaCpf', controller: 'socios', action: 'initBusca', via: 'get'

  match 'buscarCpf', controller: 'socios', action: 'busca', via: 'get'

end
