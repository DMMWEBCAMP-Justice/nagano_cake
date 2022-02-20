Rails.application.routes.draw do
  # devise_for :admins
  # devise_for :end_users

# 顧客用
# URL /end_users/sign_in ...
devise_for :end_users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
# 管理者用
# URL /admin/sign_in ...
devise_for :admin,  skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #end_user用
    root to: "homes#top"
    get 'home/about'=>'homes#about'
  scope module: :public do
    get 'end_users/my_page' => 'end_users#show'
    patch '/end_users/withdraw' =>	'end_users#withdraw'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    post	'/orders/confirm' => 'orders#confirm'
    get	'/orders/complete' => 'orders#complete'
    get	'/end_users/finished' => 'end_users#finished'
  # get 'search' => 'searches#search'
  end
  scope module: :public do
    resources :end_users, only:[:update]
    resource :end_users, only:[:edit]
    resources :items, only:[:index, :show]
    resources :cart_items, only:[:index, :update, :destroy, :create]
    resources :orders, only:[:new, :create, :index, :show ]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end
  #admin用
  namespace :admin do
   root to: "/homes#top"
  resources :end_users, only:[:index, :show, :edit, :update]
   resources :items, only:[:index, :new, :create, :show, :edit, :update]
   resources :genres, only:[:index, :create, :edit, :update]
   resources :orders, only:[:show, :index, :update] do
    resources :order_details, only:[:update]
   end
  end

end