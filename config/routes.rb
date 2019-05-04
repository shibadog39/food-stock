# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'eatery/suppliers#new'
  devise_for :shops, controllers: {
    registrations: 'shops/registrations',
    sessions: 'shops/sessions'
  }

  # 飲食店画面
  namespace :eatery, path: '/' do
    resources :suppliers
    resources :items
    resources :actual_stocks, only: %i[index update]
    get 'order_stocks/index'
    get 'order_stocks/create'
    get 'order_stocks/update'
    get 'proper_stocks/index'
    get 'proper_stocks/create'
    get 'proper_stocks/update'
  end

  # 管理画面あとで作らなきゃいけない
  namespace :admin, path: '/' do
  end
end
