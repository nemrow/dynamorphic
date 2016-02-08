class BasicBuyStrategy < ActiveRecord::Base
  has_many_dynamorphic :portfolios, as: :buy_strategy
end
