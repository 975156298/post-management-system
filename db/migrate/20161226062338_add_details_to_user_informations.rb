class AddDetailsToUserInformations < ActiveRecord::Migration[5.0]
  def change
    add_column :user_informations, :height, :string
    add_column :user_informations, :star, :string
  end
end
