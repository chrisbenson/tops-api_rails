TopsApiRails::Application.routes.draw do

  namespace :services do

    # namespace :admin do
    #   resources :auth_tokens
    #   resources :practices
    # end

    namespace :authentication do
      namespace :v1 do
        resources :auth_tokens, :only => [:create, :destroy]
        resources :practices, :only => [:index]
      end
    end

    namespace :payments do
      namespace :stripe do
        namespace :v1 do
          resources :charges
          resources :subscriptions
          namespace :connect do
            resources :authorizations
            resources :redirects
            resources :webhooks
            resources :access_tokens
          end
          namespace :test do
            resources :charges
            resources :subscriptions
            namespace :connect do
              resources :authorizations
              resources :redirects
              resources :webhooks
              resources :access_tokens
            end
          end
        end
      end
    end
  end

  namespace :topsortho do

    namespace :authentication do
      namespace :v1 do
        resources :auth_tokens, :only => [:create, :destroy]
        resources :practices, :only => [:index]
      end
    end

    namespace :payments do
      namespace :v1 do
        resources :charges
        resources :subscriptions
        namespace :connect do
          resources :authorizations
          resources :tokens
          resources :webhooks
          resources :access_tokens
        end
        namespace :test do
          resources :charges
          resources :subscriptions
          namespace :connect do
            resources :authorizations
            resources :tokens
            resources :webhooks
            resources :access_tokens
          end
        end
      end
    end

  end

  namespace :topscephmate do
    namespace :authentication do
      namespace :v1 do
        resources :auth_tokens, :only => [:create, :destroy]
        resources :license_tokens, :only => [:create, :destroy, :update]
        resources :practices, :only => [:index]
        resources :user_accounts, :only => [:create, :destroy, :update]
      end
    end
  end

  namespace :website do
    namespace :v1 do
      resources :demo_requests, :only => [:create]
    end
  end

# Any other routes are handled here (as ActionDispatch prevents RoutingError from hitting ApplicationController::rescue_action).
#  match "*path", :to => "application#routing_error", :via => :all

end
