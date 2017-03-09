class MainController < ApplicationController
  # before_action :check_cookies
  def index
    @get_note = NoteInfo.all.order(updated_at: :desc)
    @get_notes = []
    for notes in @get_note
      users_info =[]
      user_info = UserInformation.find_by_name(notes.user_id)
      users_info.push(notes)
      users_info.push(user_info)
      @get_notes.push(users_info)
    end
    @get_notes
  end

  def get_user
    @user = UserInformation.find_by_name(cookies[:user_name])
    @note = NoteInfo.where(:user_id => @user[:name]).order(updated_at: :desc)
  end

  def add_note
    if params[:text].length >0 && params[:localfile] != nil
      @content = params[:text]
      @user_info = UserInformation.find_by_user(cookies[:user])
      up_file
      if NoteInfo.new(:user_id => @user_info.name,:content => @content,:note_photo => @myfile.url).save
        redirect_to '/'
      end
    end
  end

end
