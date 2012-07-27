class StockController < ApplicationController
  def index
    #@stock = Stock.create(:name => "Oracle", :symbol => "ORCL", :price => "30.00")
    #Stock.find(1)
    #StockMailer.daily_mail().deliver
  end
  
  def add
    @stock = Stock.create(:name => "Oracle", :symbol => "ORCL", :price => "30.00")
  end
  
  def create
    @user = User.find(params[:id])
    @stock = @user.stocks.build(params[:stock])
    if @stock.save
      
      flash[:success] = "Stock added!"
      respond_to do |format|
        format.html { redirect_to user_id_url(@user)  }
        format.js
      end
    else
    end
  end

  def display
  end
  
  def get_price
    @symbol = params[:symbol]
    
    #render :partial => 'get_price', :symbol => @symbol
    render :inline => "<%= Stock.get_price(params[:symbol]) %>" 
  end
  
end
