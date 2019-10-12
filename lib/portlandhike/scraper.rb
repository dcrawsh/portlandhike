
class Portlandhike::Scraper
  
  attr_reader :url, :url_two

  def initialize(area)
    realarea = area.split(/\s/).map(&:capitalize).join('+')
    @url = "https://www.oregonhikers.org/w/index.php?title=Special:Ask&limit=500&q=%5B%5BCategory%3A#{realarea}%5D%5D&p=format%3Dbroadtable&po=%3FDifficulty%0A%3FDistance%0A%3FElevation+gain%0A&sort=&order=ASC"    
  end

  def hikes
    doc = Nokogiri::HTML(open(@url))
    doc.css("#mw-content-text table tbody tr td a").map {|a| a.text}.select do |text|
    text.upcase.end_with?("HIKE")
    end
   end 

   def details(input)
    @url_two = "https://www.oregonhikers.org/field_guide/#{input.gsub(" ", "_")}"
    doc = Nokogiri::HTML(open(@url_two))
    yrpick = Portlandhike::Hike.new(doc)
    end 
    
    
end 
