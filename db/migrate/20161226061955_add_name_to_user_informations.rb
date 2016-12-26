class AddNameToUserInformations < ActiveRecord::Migration[5.0]
  def change
    add_column :user_informations, :name, :string
  end
end
