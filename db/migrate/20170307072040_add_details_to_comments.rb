class AddDetailsToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :floor_number, :string
  end
end
