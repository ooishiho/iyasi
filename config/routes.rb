Rails.application.routes.draw do


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  devise_for :users, skip: [:passwords],controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "user/homes#top"
  get '/home/top' => 'admin/homes#top'
  get '/home/about' => 'public/homes#about', as: 'about'
  namespace :admin do
    resources :post_items, only: [:index,:destroy,:show]
    resources :customers, only:[:index,:show,:edit,:update]
  end

  namespace :user do
    resources :post_items, only:[:index,:new,:create,:show]
    resources :customrers, only:[:edit,:update]

    get '/my_page' => 'customers#show'
    get '/unsubscribe' => 'customers#unsubscribe'
    patch '/withdraw' => 'customers#withdraw'
    get '/rankings' => 'rankings#index'
    resources :bookmarks, only:[:index,:create,:destroy]
    resources :follows, only:[:index,:create,:destroy]
  end
end
