Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'campaigns/:campaign_id', to: 'campaigns#show'
end
