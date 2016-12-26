Rails.application.routes.draw do
  get 'main/index'

  root 'land#index'

  get 'land/register'
  get 'land/land' => 'land#land'
  post '/land/set_register_info' => 'land#set_register_info'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
