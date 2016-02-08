class Portfolio < ActiveRecord::Base
  belongs_to_dynamorphic :buy_strategy
end
