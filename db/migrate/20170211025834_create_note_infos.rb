class CreateNoteInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :note_infos do |t|
      t.string :user_id
      t.string :content
      t.string :note_photo

      t.timestamps
    end
  end
end
