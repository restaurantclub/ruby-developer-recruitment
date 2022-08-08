class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.decimal :lat, precision: 9, scale: 6
      t.decimal :lng, precision: 9, scale: 6
      t.string :address, null: false
      t.string :city, null: false
      t.references :zone, foreign_key: true
      t.timestamps
    end
  end
end
