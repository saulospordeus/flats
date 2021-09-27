class AddPetToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :pet, :boolean
  end
end
