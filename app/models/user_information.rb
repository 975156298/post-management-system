class UserInformation < ApplicationRecord
  has_many :note_info, foreign_key: :user_id, primary_key: :user
end
