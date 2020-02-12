Rails.application.routes.draw do
  root 'articles#index'


  get 'categories', to: 'categories#index', as: 'categories'
  get 'categories/new', to: 'categories#new', as: 'new_category'
  get 'categories/:id', to: 'categories#show', as: 'category'
  post 'categories', to: 'categories#create'
  get 'categories/:id/edit', to: 'categories#edit', as: 'edit_category'
  patch 'categories/:id', to: 'categories#update'
  delete 'categories/:id', to: 'categories#destroy', as: 'category_delete'
  

  get 'articles', to: 'articles#index', as: 'articles'
  get 'articles/new', to: 'articles#new',  as: 'new_article'
  get 'articles/:id', to: 'articles#show', as: 'article'
  post 'articles', to: 'articles#create'
  get 'articles/:id/edit', to: 'articles#edit', as: 'edit_article'
  patch 'articles/:id', to: 'articles#update'
  delete 'articles/:id', to: 'articles#destroy', as: 'article_delete'
 

end
