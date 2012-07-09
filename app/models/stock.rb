class Stock < ActiveRecord::Base
  serialize :past_prices, Array
end
