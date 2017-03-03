class MainController < ApplicationController
  # before_action :check_cookies
  def index
    @get_note = NoteInfo.all

    p '====================@getsdfg'
    p @get_note
    @get_notes = []
    for notes in @get_note
      users_info =[]
      user_info = UserInformation.find_by_user(notes.user_id)
      users_info.push(notes)
      users_info.push(user_info)
      @get_notes.push(users_info)
    end
    p @get_notes
    @get_notes
  end

end
