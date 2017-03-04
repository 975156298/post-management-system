class NoteInfo < ApplicationRecord
  belongs_to :user_information, foreign_key: :user_id, primary_key: :user

  has_many :comments, foreign_key: :comment_note_id, primary_key: :id, dependent: :destroy
end
