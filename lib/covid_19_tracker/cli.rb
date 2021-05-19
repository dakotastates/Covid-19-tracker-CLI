#Our CLI Controller
class CLI

  def call
    start
    start_menu
    goodbye
  end

  def start
    @scraper = Scraper.new()
    @scraper.parse_all
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
        top_10_menu
      when "3"
        puts "about"
      when "4"
        start
      end
    end
  end

  def top_10_menu
    top_10_menu_print
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        top_10_total_cases_menu
      when "2"
        top10_total_deaths_print
      when "3"
        top10_total_vaccinations_print
      when "4"
        puts "Search By Country"
      when "5"
        start_menu

      end
    end
  end

  def top_10_total_cases_menu
    top10_total_cases_print
    input = nil
    while input != "exit"
      puts "Enter the number of the country you'd like more data on."
      input = gets.strip.downcase

      if input.to_i > 0
        country_menu(@sortedCasesData[input.to_i-1])
      elsif input == "start"
        start_menu
      end

    end
  end

  def country_menu(country)
    country_data_print(country)
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "Demographics"
      when "2"
        puts "Lastest Report"
      when "3"
        puts "All Reprots"
      when "4"
        puts "Go Back"
      when "5"
        start_menu

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
    global = Country.global[0]
    puts "-----------------------------------------"
    puts ""
    puts "-------------Global----------------------"
    puts ""
    puts "Updated on => #{global.last_report.date}"
    puts "Cases => #{global.last_report.total_cases}"
    puts "Deaths => #{global.last_report.total_deaths}"
    puts "Vaccinated => #{global.last_report.people_vaccinated}"

    puts ""
    #  Country.global.each.with_index(1) do |country, i|
    #   puts "#{i}) #{country.location} "
    # end
    binding.pry
    puts ""
    puts "-----------------------------------------------"
    short_start_menu_print

  end

  def top_10_menu_print
    puts "------------------------------------------"
    puts ""
    puts "1) Dislay top 10 Countries by Total Cases"
    puts "2) Dislay top 10 Countries by Total Deaths"
    puts "3) Dislay top 10 Countries by Vaccinations"
    puts "4) Search by Country name"
    puts "5) Go Back"
    puts ""
    puts "-----------------------------------------------"

  end

  def short_top_10_menu_print
    puts "-----------------------------------------------"
    puts "1) Cases | 2) Deaths | 3) Vaccinations | 4) Search | 5) Go Back"
    puts "-----------------------------------------------"

  end

  def short_country_data_menu_print
    puts "-----------------------------------------------"
    puts "1) Demographics | 2) Latest Report | 3) All Reports | 4) Go Back"
    puts "-----------------------------------------------"
  end

  def top10_total_cases_print

    puts "-----------------------------------------"
    puts ""
    puts "The following countries have the top 10 total cases:"
    puts ""
    puts "---Country--- --> ---Total Cases---"
    puts ""
    @sortedCasesData = Country.all_sorted.sort_by { |obj| -obj.last_report.total_cases.to_i }
    (0..9).each.with_index(1) do |num, i|
      puts "#{i}) #{@sortedCasesData[num].location} --> #{@sortedCasesData[num].last_report.total_cases}"
    end
    # binding.pry
    puts ""
    puts "-----------------------------------------------"
    # short_top_10_menu_print

  end

  def top10_total_deaths_print
    puts "-----------------------------------------"
    puts ""
    puts "The following countries have the top 10 total Deaths:"
    puts ""
    puts "---Country--- --> ---Total Deaths---"
    puts ""
    sortedData = Country.all_sorted.sort_by { |obj| -obj.last_report.total_deaths.to_i }
    (0..9).each.with_index(1) do |num, i|
      puts "#{i}) #{sortedData[num].location} --> #{sortedData[num].last_report.total_deaths}"
    end
    # binding.pry
    puts ""
    puts "-----------------------------------------------"
    short_top_10_menu_print


  end

  def top10_total_vaccinations_print
    puts "-----------------------------------------"
    puts ""
    puts "The following countries have the top 10 Total People Vaccinations:"
    puts ""
    puts "---Country--- --> ---Vaccinated---"
    puts ""
    sortedData = Country.all_sorted.sort_by { |obj| -obj.last_report.people_vaccinated.to_i }
    (0..9).each.with_index(1) do |num, i|
      puts "#{i}) #{sortedData[num].location} --> #{sortedData[num].last_report.people_vaccinated}"
    end
    # binding.pry
    puts ""
    puts "-----------------------------------------------"
    short_top_10_menu_print

  end

  def country_data_print(country)
    puts "--------------------#{country.location}-----------------"
    puts "Date: 111111"
    puts ""
    puts "Total Cases => 1234 -- Per million => 1234"
    puts "New Cases => -- Per million => 1234"
    puts "Total Deaths => -- Per million => 1234"
    puts "New Deaths => -- Per million => 1234"
    puts ""
    puts "# of Reports => 1234"
    puts ""
    puts "-----------------------------------------------"
    short_country_data_menu_print

  end

  # ~~~~~~~~~~~~~~~~Goodbye Display~~~~~~~~~~~~~~~~~~~~~~~~~~
  def goodbye
    puts "Thank you for using the Covid 19 CLI Tracker. Please Wash Your Hands."
  end
end
