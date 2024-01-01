Rails.application.routes.draw do
  root "news_articles#index"
  devise_for :users
  resources:categorys
  resources:news_articles
end
