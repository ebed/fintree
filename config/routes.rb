Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :rest, defaults: {format: 'json'} do
    scope module: :v1 do
      post 'login', to: 'authentication#login'
      post 'verify_user', to: 'authentication#verify'

    end
  end
end
