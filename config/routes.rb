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
  get '/productslist', to: 'shoppingsessions#get_list_of_products'
  get '/pay', to: 'shoppingsessions#paid'
  delete '/removeproduct', to: 'shoppingsessions#remove'
end
