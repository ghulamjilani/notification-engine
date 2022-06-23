class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :title, null: false
      t.text :content
      t.integer :importance, null: false
      t.datetime :day, null: false
      t.string :tag, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
