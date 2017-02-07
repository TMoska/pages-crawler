Rails.application.routes.draw do
  # weird to put url as url parameter because of //,
  # so went for a different endpoint url for show method
  scope '/api' do
    get 'pages', to: 'pages#index'
    get 'pages/single', to: 'pages#show'
    post 'pages', to: 'pages#create'
  end
  # Rather quick work-around the api-only thing not having a public folder accessible
  get 'docs', to: 'static#index'
  get 'docs/page/create', to: 'static#create'
  get 'docs/page/show', to: 'static#show'
  get 'docs/page/index', to: 'static#index_doc'
end
