class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_dt
      t.datetime :end_dt
      t.string :description
      t.string :link
      t.string :key
      t.string :keytype
      t.integer :venue_id
      t.boolean :published
      t.string :image

      t.timestamps
    end
  end
end
