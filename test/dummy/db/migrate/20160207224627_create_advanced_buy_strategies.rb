class CreateAdvancedBuyStrategies < ActiveRecord::Migration
  def change
    create_table :advanced_buy_strategies do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
