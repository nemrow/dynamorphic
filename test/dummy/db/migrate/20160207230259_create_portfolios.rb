class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.references :buy_strategy, polymorphic: true
      t.timestamps null: false
    end
  end
end
