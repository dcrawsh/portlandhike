
class Portlandhike::CLI  

    def run
        puts "=== HELLO HIKERS ==="
        
        puts "Please enter an area you would like to hike in, options include: 
        Portland Area
        Willamette Valley
        Oregon Coast
        Washington Coast
        Southwest Washingon
        Columbia River Gorge
        Mount Hood
        Central Oregon
        Southern Oregon
        Eastern Oregon"
        
        area = gets.chomp
        
        puts "you entered: #{area}"
        
        
        scraper = Portlandhike::Scraper.new(area) 
        puts ""
        puts "- - - Here are the Hikes - - -"
        puts scraper.hikes 
        puts ""
        puts "What hike would you like more information on?"
        input = gets.strip
        puts ""
        puts "- - - Here are the Details - - -"
        details = scraper.details(input)
        puts ''
        puts "Would you like a description of this hike? Enter Y or N"
        answer = gets.strip.downcase
        if answer == "y"
        puts details.description
        puts "Would you like to choose another hike? Enter Y or N"
        input_two = gets.strip.downcase
     if input_two == "y"
      run
    elsif input_two == "n"
      puts ""
      puts "Thank you for using portlandhike! Have a great day!"
      exit
    else
      puts ""
      puts "I don't understand that answer."
      run
    end
        elsif answer == 'n'
        puts "Would you like to choose another hike? Enter Y or N"
        input_three = gets.strip.downcase
     if input_three == "y"
      run
    elsif input_three == "n"
      puts ""
      puts "Thank you for using portlandhike! Have a great day!"
      exit
    else
      puts ""
      puts "I don't understand that answer."
      run
    end
  end
        
    
        
    
        end 

        

    

    # def print_hike(hike)
    #     puts ""
    #     puts "----------- #{hike.name} -----------"
    #     puts ""
    #     puts "Trailhead:           #{hike.trailhead}"
    #     puts "Distance:            #{hike.distance}"
    #     puts "Elevation Gain:      #{hike.elevation_g}"
    #     puts ""
    #     puts "---------------Description--------------"
    #     puts ""
    #     puts "#{hike.description}"
    #     puts ""
    #   end

end 


