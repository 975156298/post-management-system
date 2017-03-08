class MainController < ApplicationController
  # before_action :check_cookies
  def index
    @get_note = NoteInfo.all
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

  def add_note
    if params[:text].length >0 && params[:localfile] != nil
      @content = params[:text]
      @user_info = get_user
      up_file
      if NoteInfo.new(:user_id => @user_info.name,:content => @content,:note_photo => @myfile.url).save
        redirect_to '/'
      end
    end
  end

end
