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

    resources :comments, :only => [:create, :destroy]
    resources :ratings, :only => [:create, :update, :destroy]
  end


  root :to => "dreams#index"

end
