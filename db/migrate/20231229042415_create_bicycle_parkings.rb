class CreateBicycleParkings < ActiveRecord::Migration[7.1]
  def change
    create_table :bicycle_parkings do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :opening_hours, null: false
      t.integer :bicycle_capacity, null: false, default: 0
      t.integer :motorized_bicycle_under_50cc_capacity, null: false, default: 0
      t.integer :motorized_bicycle_under_125cc_capacity, null: false, default: 0
      t.integer :bicycle_and_motorized_bicycle_under_50cc_capacity, null: false, default: 0
      t.integer :motorcycle_capacity, null: false, default: 0
      t.string :motorcycle_price, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.boolean :published, null: false, default: false

      t.timestamps
    end
    add_index :bicycle_parkings, :name, unique: true
    add_index :bicycle_parkings, :location, unique: true
  end
end
