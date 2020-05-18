class AddLamsToListing < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :lams, :integer
  end
end
