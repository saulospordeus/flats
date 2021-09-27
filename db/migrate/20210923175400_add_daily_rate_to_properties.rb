class AddDailyRateToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :daily_rate, :decimal
  end
end
