class StockMailer < ActionMailer::Base
  default :from => "testingrailsmailerforfree@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.stock_mailer.daily_mail.subject
  #
  def daily_mail
    @greeting = "Hi"
    @stock = Stock.find(1)
    #@stock_name = "Oracle"
    #@stock_price = "30.00"
    mail :to => "ramk1024@yahoo.com", :subject => "Your daily stock update"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.stock_mailer.extra_alert.subject
  #
  def extra_alert
    @greeting = "Hi"

    mail :to => "to@example.org"
  end
  
  
  def buy_alert(stock, email)
    @stock = stock
    mail :to => email, :subject => "Buy this stock!"
  end
  
  def sell_alert(stock, email)
    @stock = stock
    mail :to => email, :subject => "Sell this stock!"
  end
  
end
