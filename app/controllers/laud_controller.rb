class LaudController < ApplicationController

  def index
    @laud_info = []
    @note_infos = NoteInfo.where({:user_id => get_user.name})
    for note_info in @note_infos
      user_info = []
      user_info.push(note_info)
      @laud = Laud.where({:note_id => note_info.id}).where.not(:user_name => get_user.name).order(created_at: :desc)
      for laud in @laud
        laud.update(:is_read => true)
        user_info.push(UserInformation.find_by_name(laud.user_name))
        @laud_info.push(user_info)
      end
    end
    @laud_info
  end

  def get_user_laud
    @laud = Laud.where({:note_id => params[:note_id],:user_name => get_user.name})
    render :json => {:data => @laud}
  end

  def add_laud
    if Laud.new({:note_id => params[:note_id],:user_name => get_user.name, :is_laud => true, :is_read => false}).save
      render :json => {:status => '200'}
    end
  end

  def delete_laud
    @laud_info = Laud.find_by_id(params[:laud_id]).delete
  end
end
