class AddDetailsToUserInformations < ActiveRecord::Migration[5.0]
  def change
    add_column :user_informations, :hobby, :string
  end
end
