Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  
  # 投稿内容の中にpost_commentsは入るので　do ~endと記載。ネストする
  resources :post_images, only: [:new, :create, :index, :show, :destroy]do
    resources :post_comments, only:[:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  
  get 'homes/about' => 'homes#about', as: 'about'
  # user:test1
  # email:test1@a
  # pass:test11
end
