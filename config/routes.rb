Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :bills
  
  root 'welcome#index'
  get 'expenses', to: 'bills#expenses'
  get 'debt', to: 'bills#debt'
  delete "edit_debt", to: "bills#edit_debt", as: "edit_debt"

end
