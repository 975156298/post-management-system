class AddDetailsToUserInformations < ActiveRecord::Migration[5.0]
  def change
    add_column :user_informations, :user_image, :string
  end
end
