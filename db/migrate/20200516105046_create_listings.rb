class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :manufacturer
      t.string :model
      t.string :style
      t.integer :year
      t.integer :engine
      t.integer :price
      t.string :location
      t.integer :mileage
      t.binary :lams
      t.text :description

      t.timestamps
    end
  end
end
