class Covid19Tracker::Global

  attr_accessor :total_cases, :total_deaths, :total_recovered, :first_dose, :fully_vaccinated

def self.stats

  puts <<-DOC.gsub /^\s*/, ''
    Total Cases: 12345
    Total Recovered: 21345
    Total Deaths: 432424
    Atleast 1 dose: 2344
    Fully Vaccinated: 423424234
  DOC

end


end
