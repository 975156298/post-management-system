class CreateUserInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_informations do |t|
      t.string :user
      t.string :password
      t.string :email
      t.timestamps
    end
  end
end
