Rails.application.routes.draw do
  get '/client/:name', action: :show, controller: 'clients', param: :name
  get '/uf/', action: :show, controller: 'fostering_units'
end
