class UserInformationController < ApplicationController
  def index
  end

  def update
    user_info = UserInformation.find_by_user(params[:user])
    p user_info
    if user_info
      user_info.update(update_info)
      return render :json => {status: 200}
    end
    render :json => {status: 'sss'}
  end

  def delete_user
    UserInformation.find_by_user('zhuxuey').delete
  end

  private

   def update_info
     {
         name: params[:name],
         height: params[:height],
         star: params[:star],
         sex: params[:sex],
         birthday_time: params[:birthday_time].to_time,
         age: Time.new(params[:birthday_time]).year,
         work:params[:work],
         contact: params[:phone],
         address: params[:address],
         degree: params[:degree]
     }
   end
end
