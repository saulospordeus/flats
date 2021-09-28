class AddPropertyTypeRefToProperty < ActiveRecord::Migration[6.1]
  def change
    add_reference :properties, :property_type, foreign_key: true
  end
end
