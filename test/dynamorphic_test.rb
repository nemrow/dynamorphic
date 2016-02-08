require 'test_helper'

class DynamorphicTest < ActiveSupport::TestCase

  test "sets and gets the belongs_to_dynamorphic association" do
    portfolio = Portfolio.create
    buy_strategy = BasicBuyStrategy.create
    portfolio.buy_strategy = buy_strategy
    assert_equal portfolio.buy_strategy, buy_strategy
  end

  test "gets the has_many_dynamorphic association" do
    portfolio_1 = Portfolio.create
    portfolio_2 = Portfolio.create

    buy_strategy = BasicBuyStrategy.create

    portfolio_1.buy_strategy = buy_strategy
    portfolio_2.buy_strategy = buy_strategy

    assert_equal 2, buy_strategy.portfolios.length
  end

  test "sets the has_many_dynamorphic association for individual objects" do
    portfolio_1 = Portfolio.create

    buy_strategy = BasicBuyStrategy.create

    buy_strategy.add_portfolios(portfolio_1)

    assert_equal 1, buy_strategy.portfolios.length
  end

  test "sets the has_many_dynamorphic association for arrays of objects" do
    portfolio_1 = Portfolio.create
    portfolio_2 = Portfolio.create

    buy_strategy = BasicBuyStrategy.create

    buy_strategy.add_portfolios([portfolio_1, portfolio_2])

    assert_equal 2, buy_strategy.portfolios.length
  end
end
