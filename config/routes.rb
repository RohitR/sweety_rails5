Rails.application.routes.draw do
  get 'blood_glucoses/show'
  mount ActionCable.server => '/cable'

resources :users
resources :welcomes
resources :change_user_password
root 'welcomes#new'

resources :reports do
  collection do
    get 'daily_reports'
    post 'daily_reports'
    get 'monthly_reports'
    post 'monthly_reports'
    get 'date_wise_reports'
    post 'date_wise_reports'
  end
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
