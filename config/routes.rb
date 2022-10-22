Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  # user:test1
  # email:test1@a
  # pass:test11
end
