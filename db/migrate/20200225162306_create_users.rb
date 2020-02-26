class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|

          t.timestamps
          t.string :name
          t.string :last_name
          t.string :password_digest
          t.string :token
          t.text :description

      end
    add_index :users, :token, unique: true
  end
end

