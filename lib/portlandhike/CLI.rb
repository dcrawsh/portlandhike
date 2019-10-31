
class Portlandhike::CLI 
  attr_reader :scraper, :details
    
    def run
      puts "=== HELLO HIKERS ==="
        
      area = choose_area
      
      list_hikes(area)

      choose_hike

      description 

      options

    end 
      
  
  
      
    def options 
        puts "Would you like to choose another hike? Enter Y or N"
        input = gets.strip.downcase
        if input == "y"
          run
        elsif input == "n"
          puts ""
          puts "Thank you for using portlandhike! Have a great day!"
          exit
        else
          puts ""
          puts "I don't understand that answer."
          run
        end
    end 
      
      

   
   
  def choose_area
    puts "Please enter an area you would like to hike in, options include:"
        
    Portlandhike::Hike::AREAS.each {|area| puts area}
    
    area = gets.chomp
    
    puts "you entered: #{area}"
    area
  end

  def list_hikes(area)
    @scraper = Portlandhike::Scraper.new(area) 
    puts ""
    
    if scraper.hikes.length > 0
      puts "- - - Here are the Hikes - - -"
      puts scraper.hikes 
    elsif scraper.hikes.length < 1
      puts "That is not a valid option"
      run
    end
  end

  def choose_hike
    puts ""
    puts "What hike would you like more information on?"
    input = gets.strip
    puts ""
    puts "- - - Here are the Details - - -"
    begin
    @details = scraper.details(input)
    rescue 
      puts "That is not a valid option, please choose from the list"
      choose_hike
    end
    puts ''
  end

  def description
    puts "Would you like a description of this hike? Enter Y or N"
      answer = gets.strip.downcase
      if answer == "y"
        puts @details.description
      elsif answer == "n"
        puts ""
        puts "Thank you for using portlandhike! Have a great day!"
        exit
      else 
        puts "That is not a valid option, please choose from the list"
        description
      end 
  end 
  
end 


