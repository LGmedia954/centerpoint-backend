class CreateDirectories < ActiveRecord::Migration[6.1]
  def change
    create_table :directories do |t|
      t.string :name

      t.timestamps
    end
  end
end
