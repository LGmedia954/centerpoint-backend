class CreateAnnouncements < ActiveRecord::Migration[6.1]
  def change
    create_table :announcements do |t|
      t.text :comment
      t.integer :user_id
      t.integer :organization_id

      t.timestamps
    end
  end
end
