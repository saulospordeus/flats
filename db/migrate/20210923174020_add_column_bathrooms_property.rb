class AddColumnBathroomsProperty < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :bathrooms, :integer
  end
end
