class LaudController < ApplicationController


  def get_user_laud
    @laud = Laud.where({:note_id => params[:note_id],:user_name => get_user.name})
    render :json => {:data => @laud}
  end

  def get_note__laud_num
    @num = Laud.where({:note_id => params[:note_id]}).length
  end

  def add_laud
    if Laud.new({:note_id => params[:note_id],:user_name => get_user.name, :is_laud => true, :is_read => false}).save
      render :json => {:status => '200'}
    end
  end

  def delete_laud
    @laud_info = Laud.find_by_note_id(params[:note_id]).delete
  end
end
