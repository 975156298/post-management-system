class CommentController < ApplicationController
  def index
    @comments = Comment.where(:to_uesr_id => get_user.name).order(created_at: :desc)
    @note_info = []
    for comment in @comments
      comment.update(:is_read => 'true')
      if comment.comment_user_id != comment.to_uesr_id
        coments = []
        coments.push(comment)
        coments.push(NoteInfo.find_by_id(comment.comment_note_id))
        coments.push(UserInformation.find_by_name(comment.comment_user_id))
        @note_info.push(coments)
      end
    end
    @note_info
    p '-------------------note'
    p @note_info
  end

  def add_comment

    if Comment.new(comment_info).save
      render :json => {status: '200'}
    else
      render :json => {status: 'error'}
    end
  end

  def del_comment
    Comment.find_by_id(pamars[:comment_id]).delete
  end

  private

  def comment_info
    {
        :comment_note_id => params[:note_id],
        :comment_user_id => get_user.name,
        :to_uesr_id => params[:to_uesr_id],
        :comment_content => params[:comment_content],
        :floor_number => params[:floor_number],
        :is_read => params[:is_read]
    }
  end


end
