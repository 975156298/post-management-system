class Comment < ApplicationRecord
  belongs_to :note_info, foreign_key: :comment_note_id, primary_key: :id
end
