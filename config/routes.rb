Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
  post '/shoppingsessions', to: 'shoppingsessions#create'
  post '/addproduct', to: 'shoppinglists#create'
end
