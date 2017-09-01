Rails.application.routes.draw do

  get 'home/index'
  resources :shelters
  resources :needs

  root to: 'home#index'
  namespace :api do
    namespace :v1 do

      post "/google-sheet-update" => "hooks#sheet_update"

      get "/needs" => 'needs#index'
      get "/shelters" => 'shelters#index'
    end
  end
end
