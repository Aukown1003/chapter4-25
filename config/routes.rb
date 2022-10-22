Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'
  # user:test1
  # email:test1@a
  # pass:test11
end
