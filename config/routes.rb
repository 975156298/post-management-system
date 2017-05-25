Rails.application.routes.draw do

  get 'comment/index'
  post 'comment/add_comment' => 'comment#add_comment'

  get 'user_information/index'
  get 'user_information/delete_user'
  get "user_information/get_user_info"
  get 'user_information/get_all_user'
  post 'user_information/update' => 'user_information#update'
  post 'user_information/update_password' => 'user_information#update_password'


  get 'user_center/index'
  post 'user_center/add_image' => 'user_center#add_image'

  get 'main/index'
  get 'main/get_user_info'

  post '/main/add_note' => 'main#add_note'

  root 'land#index'
  get 'land/register'
  get 'land/land' => 'land#land'
  post '/land/set_register_info' => 'land#set_register_info'

  post 'note_info/add_note' => 'note_info#add_note'
  post 'note_info/update_note' => 'note_info#update_note'
  get 'note_info/del_note'
  get 'note_info/get_note' => 'note_info#get_note'
  get 'note_info/index'
  get 'note_info/user_note'


  get 'laud/index'
  get 'laud/get_user_laud'
  post 'laud/add_laud'
  post 'laud/delete_laud'

  get 'admin/get_admin'
  post 'admin/add_admin'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
