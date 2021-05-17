#Our CLI Controller
class Covid19Tracker::CLI

  def call
    start
    start_menu
    goodbye
  end

  def start
    puts "Welcome to the Covid-19 Tracker"
  end

  # ~~~~~~~~~~~~~~~~~~~~~Menus~~~~~~~~~~~~~~~~~~~~~~~~~

  def start_menu
  start_menu_print
  input = nil
  while input != "exit"
    input = gets.strip.downcase
    case input
    when "1"
      print_global
    when "2"
      country_menu
    when "3"
      puts "about"
    when "4"
      start
    end
  end
end

def country_menu
  country_menu_print
  input = nil
  while input != "exit"
    input = gets.strip.downcase
    case input
    when "1"
      puts "Cases"
    when "2"
      puts "Deaths"
    when "3"
      puts "Recovered"
    when "4"
      puts "Search By Country"
    when "5"
      start_menu_print

    end
  end
end

# ~~~~~~~~~~~~~~~~~Print Menus~~~~~~~~~~~~~~~~~~~~~~~~~~~

def start_menu_print
  puts "------------------------------------------"
  puts "Please select a  number: "
  puts ""
  puts "1) Global Info"
  puts "2) Info By Country "
  puts "3) About Covid 10"
  puts "4) Go Back"
  puts ""
  puts "------------------------------------------"
end

def short_start_menu_print

  puts "Please select a  number: "
  puts ""
  puts "1) Global Info | 2) Info By Country | 3) About Covid 10 | 4) Go Back"
  puts ""
  puts "------------------------------------------"
end

def print_global
  puts ""
  puts"-------------Global --------------"
  puts ""
  puts "Total Number of Cases:    "
  puts "Total Number of Deaths:   "
  puts "Total Active Cases:       "
  puts "Total Recovered Cases:    "
  puts "Total Critical Cases:    "
  puts ""
  short_start_menu_print

end

def country_menu_print
  puts "------------------------------------------"
  puts ""
  puts "1) Dislay top 10 Countries by Total Cases"
  puts "2) Dislay top 10 Countries by Total Deaths"
  puts "3) Dislay top 10 Countries by Total New Cases"
  puts "4) Search by Country name"
  puts "5) Go Back"
  puts ""
  puts "------------------------------------------"

end

  # ~~~~~~~~~~~~~~~~Goodbye Display~~~~~~~~~~~~~~~~~~~~~~~~~~
  def goodbye
    puts "Thank you for using the Covid 19 CLI Tracker. Please Wash Your Hands."
  end
end
