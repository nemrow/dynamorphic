class CreateBasicBuyStrategies < ActiveRecord::Migration
  def change
    create_table :basic_buy_strategies do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
