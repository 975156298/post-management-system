class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :admin_user
      t.string :admin_psw

      t.timestamps
    end
  end
end
