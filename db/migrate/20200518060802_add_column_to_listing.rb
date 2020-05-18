class AddColumnToListing < ActiveRecord::Migration[5.2]
  def change
    add_reference :listings, :location, foreign_key: true
    add_reference :listings, :manufacturer, foreign_key: true
    add_reference :listings, :style, foreign_key: true
  end
end
