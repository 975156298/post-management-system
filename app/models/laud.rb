class Laud < ApplicationRecord
  belongs_to :note_info, foreign_key: :note_id, primary_key: :id
end
