class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address
      t.string :suite
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.text :mission
      t.string :website
      t.integer :category_id

      t.timestamps
    end
  end
end
