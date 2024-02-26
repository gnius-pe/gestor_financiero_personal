Rails.application.routes.draw do
  devise_for :usuarios
  
  resources :usuarios, only: [:new, :create]
  get 'iniciar_sesion', to: 'sesiones#new'
  post 'iniciar_sesion', to: 'sesiones#create'
  delete 'cerrar_sesion', to: 'sesiones#destroy'
  get 'perfil_usuario', to: 'usuarios#perfil', as: 'perfil_usuario'
  root 'sesiones#new'
  #################
  get 'usuarios/new'
  get 'usuarios/create'
  get 'sesiones/new'
  get 'sesiones/create'
  get 'sesiones/destroy'
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
