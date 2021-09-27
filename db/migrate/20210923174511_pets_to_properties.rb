class PetsToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :pets, :boolean
    remove_column :properties, :pet, :boolean
  end
end
