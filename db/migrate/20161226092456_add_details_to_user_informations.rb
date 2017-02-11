class AddDetailsToUserInformations < ActiveRecord::Migration[5.0]
  def change
    add_column :user_informations, :sex, :string
    add_column :user_informations, :age, :integer
    add_column :user_informations, :birthday_time, :datetime
    add_column :user_informations, :work, :string
    add_column :user_informations, :contact, :string
    add_column :user_informations, :address, :string
    add_column :user_informations, :degree, :string
  end
end
