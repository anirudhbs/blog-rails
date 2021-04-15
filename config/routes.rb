Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "articles#index"

  resources :articles do
    resources :comments
    delete 'delete_attachment/:id', to: 'articles#delete_attachment', as: :delete_attachment
    post 'publish', to: 'articles#publish'
  end
  get 'my/articles', to: 'articles#my_articles'
  get 'articles-to-publish', to: 'articles#submitted_article'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  mount Flipper::UI.app(Flipper) => '/flipper'
end
