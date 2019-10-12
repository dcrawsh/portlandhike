class Portlandhike::Hike
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