Lucidly::Application.routes.draw do
  devise_for :users

  resources :admin, :only => [:index] do
    member do
      get 'editreject'
      put 'reject'
      put 'accept'
    end
    collection do
      get 'dreams'
    end
  end

  resources :dreams do
    collection do
      get 'about'
      get 'all'
      get 'mydreams'
    end
    member do
      put 'submit'
    end
    member { post :vote }
    resources :comments, :only => [:create, :destroy]
  end

  get 'tags/:tag', to: 'dreams#index', as: :tag
  root :to => "dreams#index"

end
