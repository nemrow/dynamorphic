class AdvancedBuyStrategy < ActiveRecord::Base
  has_many_dynamorphic :portfolios, as: :buy_strategy
end
