class AddPropertyLocationToProperty < ActiveRecord::Migration[6.1]
  def change
    add_reference :properties, :property_location, foreign_key: true
  end
end
