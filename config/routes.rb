Rails.application.routes.draw do
  resources :pages, only: [:index, :create] do
  end
  # weird to put url as url parameter because of //,
  # so went for a different endpoint url
  get 'pages/single', to: 'pages#show'
end
