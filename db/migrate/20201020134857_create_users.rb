class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :profession
      t.string :first_name
      t.string :last_name
      t.text :profile
      t.timestamp :icon
      t.string :new_email
      t.string :new_password
      t.string :image

      t.timestamps
    end
  end
end
