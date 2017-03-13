class AddDetailsToNoteInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :note_infos, :laud_num, :integer
  end
end
