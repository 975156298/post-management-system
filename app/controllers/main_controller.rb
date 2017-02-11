class MainController < ApplicationController
  before_action :check_cookies
  def index
    @get_notes = NoteInfo.all
  end

end
