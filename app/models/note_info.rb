class NoteInfo < ApplicationRecord
  belongs_to :user_information, foreign_key: :user_id, primary_key: :user
end
