class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :email, null: false
      t.date :birthday
      t.integer :sex
      t.string :password_digest, null: false

      t.timestamps
      t.index :email, unique: true
    end
  end
end
