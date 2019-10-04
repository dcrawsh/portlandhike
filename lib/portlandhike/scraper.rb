class Portlandhike::Scraper
attr_reader :url, :url_two

def initialize(area)
case area 
when "Portland Area"
@url = "https://www.oregonhikers.org/w/index.php?title=Special:Ask&limit=500&q=%5B%5BCategory%3APortland+Area%5D%5D&p=format%3Dbroadtable&po=%3FDifficulty%0A%3FDistance%0A%3FElevation+gain%0A&sort=&order=ASC"
when "Willamette Valley"
@url = "https://www.oregonhikers.org/w/index.php?title=Special:Ask&limit=500&q=%5B%5BCategory%3AWillamette+Valley%5D%5D&p=format%3Dbroadtable&po=%3FDifficulty%0A%3FDistance%0A%3FElevation+gain%0A&sort=&order=ASC"
when "Oregon Coast"
@url = "https://www.oregonhikers.org/w/index.php?title=Special:Ask&limit=500&q=%5B%5BCategory%3AOregon+Coast%5D%5D&p=format%3Dbroadtable&po=%3FDifficulty%0A%3FDistance%0A%3FElevation+gain%0A&sort=&order=ASC"   
when "Washington Coast"
@url = "https://www.oregonhikers.org/w/index.php?title=Special:Ask&limit=500&q=%5B%5BCategory%3AWashington+Coast%5D%5D&p=format%3Dbroadtable&po=%3FDifficulty%0A%3FDistance%0A%3FElevation+gain%0A&sort=&order=ASC"   
when "Southwest Washington"
@url = "https://www.oregonhikers.org/w/index.php?title=Special:Ask&limit=500&q=%5B%5BCategory%3ASouthwest+Washington%5D%5D&p=format%3Dbroadtable&po=%3FDifficulty%0A%3FDistance%0A%3FElevation+gain%0A&sort=&order=ASC" 
when "Columbia River Gorge"
@url = "https://www.oregonhikers.org/w/index.php?title=Special:Ask&limit=500&q=%5B%5BCategory%3AColumbia+River+Gorge%5D%5D&p=format%3Dbroadtable&po=%3FDifficulty%0A%3FDistance%0A%3FElevation+gain%0A&sort=&order=ASC"   
when "Mount Hood"
@url = "https://www.oregonhikers.org/w/index.php?title=Special:Ask&limit=500&q=%5B%5BCategory%3AMount+Hood+Area%5D%5D&p=format%3Dbroadtable&po=%3FDifficulty%0A%3FDistance%0A%3FElevation+gain%0A&sort=&order=ASC"
when "Central Oregon"
@url = "https://www.oregonhikers.org/w/index.php?title=Special:Ask&limit=500&q=%5B%5BCategory%3ACentral+Oregon%5D%5D&p=format%3Dbroadtable&po=%3FDifficulty%0A%3FDistance%0A%3FElevation+gain%0A&sort=&order=ASC"   
when  "Southern Oregon"
@url = "https://www.oregonhikers.org/w/index.php?title=Special:Ask&limit=500&q=%5B%5BCategory%3ASouthern+Oregon%5D%5D&p=format%3Dbroadtable&po=%3FDifficulty%0A%3FDistance%0A%3FElevation+gain%0A&sort=&order=ASC"   
when  "Eastern Oregon"
@url = "https://www.oregonhikers.org/w/index.php?title=Special:Ask&limit=500&q=%5B%5BCategory%3AEastern+Oregon%5D%5D&p=format%3Dbroadtable&po=%3FDifficulty%0A%3FDistance%0A%3FElevation+gain%0A&sort=&order=ASC"
else
puts "that is not an area covered by this gem, please start over and chose from one of the given options"
Portlandhike::CLI.new.run
end 
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
