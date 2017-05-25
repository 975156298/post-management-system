class AdminController < ApplicationController
  def get_admin
    admin = Admin.find_by_admin_user(params[:user])
    if admin
      if admin.admin_psw == params[:password]
        cookies[:user] = admin.admin_user
        render :json =>{status: 200}
      else
        render :json =>{status: '密码不正确'}
      end
    end
  end
end
