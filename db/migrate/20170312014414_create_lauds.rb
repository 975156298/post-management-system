class CreateLauds < ActiveRecord::Migration[5.0]
  def change
    create_table :lauds do |t|
      t.string :note_id
      t.string :user_name
      t.string :is_laud
      t.string :is_read

      t.timestamps
    end
  end
end
