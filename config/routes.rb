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
  get '/home/about' => 'user/homes#about', as: 'about'
  namespace :admin do
    resources :post_items, only: [:index,:destroy,:show]
    resources :customers, only:[:index,:show,:edit,:update]
  end

  namespace :user do
    resources :post_items, only:[:index,:new,:create,:show] do
      resource :evaluation, only:[:create]
      collection do
        get 'search'
      end
    end
    
    resources :customers, only:[:edit,:update, :show]

    get '/my_page' => 'customers#my_page'
    get '/unsubscribe' => 'customers#unsubscribe'
    patch '/withdraw' => 'customers#withdraw'
    get '/rankings' => 'rankings#index'
    resources :bookmarks, only:[:index,:create,:destroy]
    resources :follows, only:[:create,:destroy,:index]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end