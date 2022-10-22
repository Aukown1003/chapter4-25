Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  
  resources :post_images, only: [:new, :index, :show]
  
  get 'homes/about' => 'homes#about', as: 'about'
  # user:test1
  # email:test1@a
  # pass:test11
end
