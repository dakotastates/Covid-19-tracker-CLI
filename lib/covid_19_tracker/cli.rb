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
        top_10_total_cases_menu
      when "3"
        top_10_total_vaccinations_menu
      when "4"
        search_by_country
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

  def top_10_total_deaths_menu
    top10_total_deaths_print
    input = nil
    while input != "exit"
      puts "Enter the number of the country you'd like more data on."
      input = gets.strip.downcase

      if input.to_i > 0
        country_menu(@sortedDeathsData[input.to_i-1])
      elsif input == "start"
        start_menu
      end

    end
  end

  def top_10_total_vaccinations_menu
    top10_total_vaccinations_print
    input = nil
    while input != "exit"
      puts "Enter the number of the country you'd like more data on."
      input = gets.strip.downcase

      if input.to_i > 0
        country_menu(@sortedVaccinationsData[input.to_i-1])
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
        country_demographics_print(country)
      when "2"
        country_latest_report_print(country)
      when "3"
        all_reports_menu(country)
      when "4"
        puts "Go Back"
      when "5"
        start_menu

      end
    end
  end

  def all_reports_menu(country)
    all_reports_print(country)
    input = nil
    while input != "exit"
      puts "Enter the number of the Report you'd like more data on."
      input = gets.strip.downcase

      if input.to_i > 0
        # country_menu(@sortedReports[input.to_i-1])
        country_report_print(@sortedReports[input.to_i-1])
      elsif input == "start"
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
    country_data_print(global)
    # binding.pry


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
    @sortedDeathsData = Country.all_sorted.sort_by { |obj| -obj.last_report.total_deaths.to_i }
    (0..9).each.with_index(1) do |num, i|
      puts "#{i}) #{@sortedDeathsData[num].location} --> #{@sortedDeathsData[num].last_report.total_deaths}"
    end
    # binding.pry
    puts ""
    puts "-----------------------------------------------"
    # short_top_10_menu_print


  end

  def top10_total_vaccinations_print
    puts "-----------------------------------------"
    puts ""
    puts "The following countries have the top 10 Total People Vaccinations:"
    puts ""
    puts "---Country--- --> ---Vaccinated---"
    puts ""
    @sortedVaccinationsData = Country.all_sorted.sort_by { |obj| -obj.last_report.people_vaccinated.to_i }
    (0..9).each.with_index(1) do |num, i|
      puts "#{i}) #{@sortedVaccinationsData[num].location} --> #{@sortedVaccinationsData[num].last_report.people_vaccinated}"
    end
    # binding.pry
    puts ""
    puts "-----------------------------------------------"
    # short_top_10_menu_print

  end

  def all_reports_print(country)
    reports = country.reports.length-1

    puts "--------------All Reports---------------------------"
    puts ""
    puts "--------------#{country.location}-------------------"
    puts ""
    puts "---Date--- --> ---Cases--- --> ---Deaths--- --> ---Vaccinatinos---"
    puts ""
    @sortedReports = country.reports.sort_by { |obj| -obj.date }
    (0..reports).each.with_index(1) do |num, i|
      puts "#{i}) #{@sortedReports[num].date} --> #{@sortedReports[num].total_cases} --> #{@sortedReports[num].total_deaths} --> #{@sortedReports[num].total_vaccinations}"
    end
    # binding.pry
    puts ""
    puts "-----------------------------------------------"
    # short_top_10_menu_print

  end

  def country_data_print(country)
    puts "--------------------#{country.location}-----------------"
    puts "Date: #{country.last_report.date}"
    puts ""
    puts "Total Cases => #{country.last_report.total_cases} -- Per million => #{country.last_report.total_cases_per_million}"
    puts "New Cases => #{country.last_report.new_cases} -- Per million => #{country.last_report.new_cases_per_million}"
    puts "Total Deaths => #{country.last_report.total_deaths} -- Per million => #{country.last_report.total_deaths_per_million}"
    puts "New Deaths => #{country.last_report.new_deaths} -- Per million => #{country.last_report.new_deaths_per_million}"
    puts "Total Vaccinations => #{country.last_report.total_vaccinations} -- Per hundred => #{country.last_report.total_vaccinations_per_hundred}"
    puts ""
    puts "# of Reports => #{country.reports.count}"
    puts ""
    puts "-----------------------------------------------"
    short_country_data_menu_print

  end

  def country_demographics_print(country)
    puts "----------------------Demographics----------------------"
    puts ""
    puts "--------------------#{country.location}-----------------"
    puts ""
    puts "Population => #{country.population} -- Density => #{country.population_density}"
    puts "Median Age => #{country.median_age} -- 65+ => #{country.aged_65_older} -- 70+ => #{country.aged_70_older}"
    puts "Male Smokers => #{country.male_smokers} -- Female Smokers => #{country.female_smokers}"
    puts "Extreme Poverty => #{country.extreme_poverty} -- GDP per capita => #{country.gdp_per_capita}"
    puts "Diabetes Prevalence => #{country.diabetes_prevalence}"
    puts "Cardiovascular Death Rate => #{country.cardiovasc_death_rate}"
    puts "Handwashing Facilities => #{country.handwashing_facilities}"
    puts "Hospital Beds per thousand => #{country.hospital_beds_per_thousand}"
    puts "Life Expectancy => #{country.life_expectancy}"
    puts ""
    puts "-----------------------------------------------"
    short_country_data_menu_print

  end

  def country_latest_report_print(country)
    puts "----------------------Latest Report----------------------"
    puts ""
    puts "--------------------#{country.location}-----------------"
    puts ""
    puts "Date: #{country.last_report.date}"
    puts ""
    puts "Covid Data"
    puts ""
    puts "Total Cases => #{country.last_report.total_cases} -- per million => #{country.last_report.total_cases_per_million}"
    puts "New Cases => #{country.last_report.new_cases} -- per million => #{country.last_report.new_cases_per_million}"
    puts "Total Deaths => #{country.last_report.total_deaths} -- per million => #{country.last_report.total_deaths_per_million}"
    puts "New Deaths => #{country.last_report.new_deaths} -- per million => #{country.last_report.new_deaths_per_million}"
    puts "Total Tests => #{country.last_report.total_tests} -- per thousand => #{country.last_report.total_tests_per_thousand}"
    puts ""
    puts "----------------------Vaccination Data----------------------"
    puts ""
    puts "Total Vaccinations => #{country.last_report.total_vaccinations} -- per hundred => #{country.last_report.total_vaccinations_per_hundred}"
    puts "People Vaccinated => #{country.last_report.people_vaccinated} -- per hundred => #{country.last_report.people_vaccinated_per_hundred}"
    puts "People Fully Vaccinated => #{country.last_report.people_fully_vaccinated} -- per hundred => #{country.last_report.people_fully_vaccinated_per_hundred}"
    puts "New Vaccinatinons => #{country.last_report.new_vaccinations}"
    puts ""
    puts "-----------------------------------------------"
    short_country_data_menu_print
  end


  def country_report_print(report)
    puts "----------------------Report----------------------"
    puts ""
    puts "--------------------#{report.country.location}-----------------"
    puts ""
    puts "Date: #{report.date}"
    puts ""
    puts "Covid Data"
    puts ""
    puts "Total Cases => #{report.total_cases} -- per million => #{report.total_cases_per_million}"
    puts "New Cases => #{report.new_cases} -- per million => #{report.new_cases_per_million}"
    puts "Total Deaths => #{report.total_deaths} -- per million => #{report.total_deaths_per_million}"
    puts "New Deaths => #{report.new_deaths} -- per million => #{report.new_deaths_per_million}"
    puts "Total Tests => #{report.total_tests} -- per thousand => #{report.total_tests_per_thousand}"
    puts ""
    puts "----------------------Vaccination Data----------------------"
    puts ""
    puts "Total Vaccinations => #{report.total_vaccinations} -- per hundred => #{report.total_vaccinations_per_hundred}"
    puts "People Vaccinated => #{report.people_vaccinated} -- per hundred => #{report.people_vaccinated_per_hundred}"
    puts "People Fully Vaccinated => #{report.people_fully_vaccinated} -- per hundred => #{report.people_fully_vaccinated_per_hundred}"
    puts "New Vaccinatinons => #{report.new_vaccinations}"
    puts ""
    puts "-----------------------------------------------"
    # short_country_data_menu_print
  end

  #~~~~~~~~~~~~~~~~~~Search~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  def search_by_country
    puts "---------------------------------------"
    puts ""
    puts "Search by Country Name"
    puts "type 1) to go back"
    puts ""
    puts "---------------------------------------"
    input = gets.strip.downcase
    if input == "exit" || input =="1"
      start_menu
    end
    counter = 0
    Country.all.each do |country|
      if country.location.strip.downcase == input
        counter += 1
        country_menu(country)
      end
    end

    if counter == 0
      puts "Please Check your Spelling"
      search_by_country
    end

  end

  # ~~~~~~~~~~~~~~~~Goodbye Display~~~~~~~~~~~~~~~~~~~~~~~~~~
  def goodbye
    puts "Thank you for using the Covid 19 CLI Tracker. Please Wash Your Hands."
  end
end
