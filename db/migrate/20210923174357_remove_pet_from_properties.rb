class RemovePetFromProperties < ActiveRecord::Migration[6.1]
  def change
    remove_column :properties, :pet, :boolean
  end
end
