# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


File.open("/Users/ramkandasamy/Downloads/companylist.csv", "r") do |infile|
  while (line = infile.gets)
    stock_line = line.split(",")
    StockListing.create(:symbol => stock_line[0].delete("\""), :name => stock_line[1].delete("\""))
  end
end
    

