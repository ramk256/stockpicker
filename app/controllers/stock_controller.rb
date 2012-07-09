class StockController < ApplicationController
  def index
    #@stock = Stock.create(:name => "Oracle", :symbol => "ORCL", :price => "30.00")
    #Stock.find(1)
    #StockMailer.daily_mail().deliver
  end
  
  def add
    @stock = Stock.create(:name => "Oracle", :symbol => "ORCL", :price => "30.00")
  end

  def display
  end
end
