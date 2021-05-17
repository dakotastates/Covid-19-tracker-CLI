#Our CLI Controller
class Covid19Tracker::CLI

  def call
    list_global
    menu
    goodbye
  end

  def list_global
    puts "Welcome to the Covid 19 Tracker"
    puts <<-DOC.gsub /^\s*/, ''
      Total Cases: 12345
      Total Recovered: 21345
      Total Deaths: 432424
      Atleast 1 dose: 2344
      Fully Vaccinated: 423424234
    DOC
  end

  def display_options
    puts "Please type a number from the following menu or type exit:"
    puts "1. Cases"
    puts "2. Recovered"
    puts "3. Deaths"
    puts "4. Search"
  end

  def menu
    input = nil
    while input != "exit"
      display_options
      input = gets.strip.downcase
      case input
      when "1"
        puts "Cases: Top 10 Countries"
      when "2"
        puts "Recovery: Top 10 Countries"
      when "3"
        puts "Deaths: Top 10 Countries"
      when "4"
        puts "Search by country"
      when "global"
        list_global
      else
        puts "Please enter a valid number or type exit"
      end
    end
  end

  def goodbye
    puts "Thank you for using the Covid 19 CLI Tracker. Please Wash Your Hands."
  end
end
