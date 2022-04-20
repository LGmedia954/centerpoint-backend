class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :title
      t.string :email
      t.string :password_digest
      t.integer :organization_id

      t.timestamps
    end
  end
end
