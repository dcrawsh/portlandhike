class Portlandhike::Hike
  AREAS = [
    "Portland Area",
    "Willamette Valley",
    "Oregon Coast",
    "Washington Coast",
    "Southwest Washingon",
    "Columbia River Gorge",
    "Mount Hood Area",
    "Central Oregon",
    "Southern Oregon",
    "Eastern Oregon"
    ]
  
  attr_accessor :name, :distance, :elevation_g, :description, :trailhead, :details

  def initialize(doc)
    @description = doc.css("#mw-content-text p").text
    @details = doc.css("#mw-content-text > ul:first-of-type").text
    puts @details
  end 

  def description
    @description
  end
end 