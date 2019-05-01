# frozen_string_literal: true

Rails.application.routes.draw do
  # 飲食店画面
  namespace :eatery, path: '/' do
    resources :suppliers
    resources :items
  end

  # 管理画面あとで作らなきゃいけない
  namespace :admin, path: '/' do
  end
end
