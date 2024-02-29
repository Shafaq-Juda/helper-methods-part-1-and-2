class Director < ApplicationRecord
  root "directors#index"
  resources :directors
end
