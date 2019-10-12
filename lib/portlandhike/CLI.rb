
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
        Mount Hood Area
        Central Oregon
        Southern Oregon
        Eastern Oregon"
        
        area = gets.chomp
        
        puts "you entered: #{area}"
        
        
        scraper = Portlandhike::Scraper.new(area) 
        puts ""
       
        if scraper.hikes.length > 0
          puts "- - - Here are the Hikes - - -"
          puts scraper.hikes 
        elsif scraper.hikes.length < 1
          puts "That is not a valid option"
          Portlandhike::CLI.new.run
        end
        puts ""
        puts "What hike would you like more information on?"
        input = gets.strip
        puts ""
        puts "- - - Here are the Details - - -"
        begin
        details = scraper.details(input)
        rescue 
          puts "That is not a valid option, please choose from the list"
          puts "What hike would you like more information on?"
        input = gets.strip
        details = scraper.details(input)
        end
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
end 


