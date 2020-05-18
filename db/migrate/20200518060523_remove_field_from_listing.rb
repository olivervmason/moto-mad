class RemoveFieldFromListing < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :style, :string
    remove_column :listings, :location, :string
    remove_column :listings, :manufacturer, :string
  end
end
