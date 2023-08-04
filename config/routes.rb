Rails.application.routes.draw do
  root 'welcome#index'
  resources :entries, only: [:index, :create, :new, :edit, :update, :destroy]
  get 'entries/:id', to: 'entries#show', as: 'entry_view'
  
  # Move the search route below the resources :entries line
  get 'entries', to: 'entries#index', as: :search_entries

  get 'entries', to: 'entries#index', as: :entries_sort
end