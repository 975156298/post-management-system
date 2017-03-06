class AddDetailsToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :to_uesr_id, :string
  end
end
