class Covid19Tracker::Scraper

URL = "https://covid.ourworldindata.org/data/owid-covid-data.json"

  def parse_all
      countries = JSON.parse(self.get_countries)
      countries.collect do |country|
        Country.new(country)
    end
  end

  def get_countries
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
    # binding.pry
  end


end
