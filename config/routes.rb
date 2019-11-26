Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # user에 대한 action이 자동으로 지정됨.
  # resources :users

  root 'blog#index'

  get 'index' => 'blog#index'
  post 'index' => 'blog#login'

  # 좌측이 path, 우측이 controller의 action
  get 'sign_up' => 'blog#sign_up'
  post 'sign_up' => 'blog#create_user'

  delete 'logout' => 'blog#logout'

  get 'update' => 'blog#update'
  post 'update' => 'blog#edit'

  delete 'destroy' => 'blog#destroy'

end
