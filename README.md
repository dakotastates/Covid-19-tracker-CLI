# Covid19Tracker

The Covid 19 Tracker CLI allows for users to view Covid-19 related data from all around the world. The CLI uses the Our World in Data API to fetch a substantial amount of data and organize it for a simple to use interactive CLI. This CLI allows users to view the Global statistics and the top ten countries statistics by cases, deaths, and vaccinations. The CLI also has search functionality for quick lookup of country statistics.

## Installation

To Use the Covid-19 Tracker:
1). Fork the github repo (https://github.com/dakotastates/Covid-19-tracker-CLI)
2). In console type "cd covid_19_tracker"
3). Type "./bin/covid-19-tracker " to access the CLI.
4). Follow Instructions as prompted.

## Usage

You will be greeted with a message and options to select Global Information, Information by Country, or to find information about the Tracker itself.

Welcome to the Covid-19 Tracker
------------------------------------------
Please select a  number:

1) Global Info
2) Info By Country
3) About Covid 10
4) Go Back

------------------------------------------

When you select 1) The Global statistics about Covid 19 will be printed to the console.  

--------------------World-----------------
Date: 2021-05-18

Total Cases => 164,231,810.0 -- Per million => 21,069.41
New Cases => 622,184.0 -- Per million => 79.82
Total Deaths => 3,404,338.0 -- Per million => 436.745
New Deaths => 14,249.0 -- Per million => 1.828
Total Vaccinations => 1,528,430,072.0 -- Per hundred => 19.61

Reports => 483

When you press 2) You will be prompted to select whether you want to display top 10 countries by Cases, Deaths, or Vaccinations

------------------------------------------

1) Display top 10 Countries by Total Cases
2) Display top 10 Countries by Total Deaths
3) Display top 10 Countries by Vaccinations
4) Search by Country name
5) Go Back

-----------------------------------------------

When you make a selection the top 10 countries will be displayed where you will be able to select a number associated with the country to gather more data on the country.

----------------------------------------

The following countries have the top 10 total cases:

---Country--- --> ---Total Cases---

1) United States --> 32997331.0
2) India --> 25496330.0
3) Brazil --> 15732836.0
4) France --> 5959593.0
5) Turkey --> 5139485.0
6) Russia --> 4900995.0
7) United Kingdom --> 4466220.0
8) Italy --> 4167025.0
9) Spain --> 3619848.0
10) Germany --> 3615896.0

If you select a country you will be a menu for that particular country.

--------------------United States-----------------
Date: 2021-05-18

Total Cases => 32,997,331.0 -- Per million => 99,689.025
New Cases => 27,819.0 -- Per million => 84.045
Total Deaths => 587,219.0 -- Per million => 1,774.061
New Deaths => 760.0 -- Per million => 2.296

Total Vaccinations => 275,535,207.0 -- Per hundred => 82.39

Reports => 483

The data displayed will consist of basic Total cases, deaths, and Vaccinations for that country along with their per hundred amounts. You will then be prompted to view that countries demographics, latest report, or all of their reports.

-----------------------------------------------
1) Demographics | 2) Latest Report | 3) All Reports | 4) Go Back
-----------------------------------------------

 The demographics show some basic covid related demographics for that particular country.


--------------------United States-----------------

Population => 331,002,647.0 -- Density => 35.608
Median Age => 38.3 -- 65+ => 15.413 -- 70+ => 9.732
Male Smokers => 24.6 -- Female Smokers => 19.1
Extreme Poverty => 1.2 -- GDP per capita => 54225.446
Diabetes Prevalence => 10.79
Cardiovascular Death Rate => 151.089
Handwashing Facilities =>
Hospital Beds per thousand => 2.77
Life Expectancy => 78.86


The latest report show the last report reported from the API.

----------------------Latest Report----------------------

--------------------United States-----------------

Date: 2021-05-18

Covid Data

Total Cases => 32997331.0 -- per million => 99689.025

New Cases => 27819.0 -- per million => 84.045
Total Deaths => 587219.0 -- per million => 1774.061
New Deaths => 760.0 -- per million => 2.296
Total Tests =>  -- per thousand =>

----------------------Vaccination Data----------------------

Total Vaccinations => 275535207.0 -- per hundred => 82.39
People Vaccinated => 158365411.0 -- per hundred => 47.35
People Fully Vaccinated => 124455693.0 -- per hundred => 37.21
New Vaccinatinons => 1123306.0

The report consists of a more detailed analysis of cases, deaths, and vaccines.

If you were to select all reports, all of the reports for a particular country will be listed where you may select a report to view it.  

1) Demographics | 2) Latest Report | 3) All Reports | 4) Go Back
-----------------------------------------------

--------------All Reports---------------------------

--------------United States-------------------

---Date--- --> ---Cases--- --> ---Deaths--- --> ---Vaccinatinos---

1) 2020-01-22 --> 1.0 -->  -->
2) 2020-01-23 --> 1.0 -->  -->
3) 2020-01-24 --> 2.0 -->  -->
...

Since the United States has 483 reports (as of May 19, 2021), the CLI will display the date, number of cases, deaths, and viccinations for all of the reports.

When you select a report it will print that particular report.


----------------------Report----------------------

--------------------United States-----------------

Date: 2021-05-15

Covid Data

Total Cases => 32,923,982.0 -- per million => 99,467.428
New Cases => 28,813.0 -- per million => 87.048
Total Deaths => 585,808.0 -- per million => 1,769.799

New Deaths => 476.0 -- per million => 1.438
Total Tests =>  -- per thousand =>

----------------------Vaccination Data----------------------

Total Vaccinations => 270,832,342.0 -- per hundred => 80.98
People Vaccinated => 156,217,367.0 -- per hundred => 46.71
People Fully Vaccinated => 121,768,268.0 -- per hundred => 36.41

New Vaccinations => 2,393,676.0

-----------------------------------------------

The CLI all has search functionality so you can search for a statistics by the country location. From the country menu select 4) to go to 'Search by Country Name'

Search by Country Name
type 1) to go back

Simply type in the name of the country you want to view and you will be directed to that particular countries data screen where you can view their demographics, latest report, or all reports.  

Search by Country Name
type 1) to go back

---------------------------------------
Iran
--------------------Iran-----------------
Date: 2021-05-18

Total Cases => 2,779,415.0 -- Per million => 33,091.05
New Cases => 13,930.0 -- Per million => 165.847
Total Deaths => 77,532.0 -- Per million => 923.077
New Deaths => 310.0 -- Per million => 3.691

Total Vaccinations =>  -- Per hundred =>

Reports => 455

To leave the CLI simply type 'exit'

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/<github username>/covid_19_tracker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/<github username>/covid_19_tracker/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Covid19Tracker project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/<github username>/covid_19_tracker/blob/master/CODE_OF_CONDUCT.md).
