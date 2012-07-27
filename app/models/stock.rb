require 'open-uri'
require 'net/http'

class Stock < ActiveRecord::Base
  
  belongs_to :user
  
  attr_accessible :name, :symbol, :price, :past_prices, :user_id, :sell, :buy
  
  #we store the array of past prices as a string
  serialize :past_prices, Array
  
 # STOCK_LIST = ["Oracle", "Microsoft", "Google", "Cisco"]
  
 # NAME_TO_SYMBOL = {"Oracle" => "ORCL", "Microsoft" => "MSFT", "Google" => "GOOG", "Cisco" => "CSCO" }
  
  
  def get_current_price
    uri = URI.parse "http://download.finance.yahoo.com/d/quotes.csv"
    http = Net::HTTP.new(uri.host)
    #resp = http.get(uri.path + "?s=" + @symbol + "&f=spjk").body
    resp = http.get(uri.path + "?s=" + StockListing.find_by_name(name).symbol + "&f=pl1jk").body
    stock_info = resp.split(',')
    
    
    
    stock_info[1]
  end
  
  #this function takes in a stock symbol and looks up the value on finance.google.com
  def self.get_price(symbol)
    uri = URI.parse "http://download.finance.yahoo.com/d/quotes.csv"
    http = Net::HTTP.new(uri.host)
    resp = http.get(uri.path + "?s=" + symbol + "&f=pl1jk").body
    
    stock_info = resp.split(',')
    
    stock_info[1]
  end
  
  def current?
    updated_at.tomorrow > DateTime.now && updated_at != created_at
  end
  
  
  #this function will go through all the stocks and, if the stock is higher than the high value or lower than the low value
  def self.send_updates
    stocks = Stock.all
    
    stocks.each do |stock|
      if (stock.sell.nil? or stock.buy.nil?)
        next
      end
      current_price = stock.get_current_price.to_f
      
      #we update the price for the stock
      stock.update_attribute(:price, current_price)
      
      #we only send updates once a day
      if (!stock.current?)
        if (current_price >= stock.sell.to_f)
          # send e-mail
          StockMailer.sell_alert(stock, stock.user.email).deliver
          #update timestamp
          stock.touch
        elsif (current_price < stock.buy.to_f)
          # send e-maili
          StockMailer.buy_alert(stock, stock.user.email).deliver
          #update timestamp
          stock.touch
        end
      end
    end
    puts "Updates complete!"
  end
end
