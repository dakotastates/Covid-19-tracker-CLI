class Report

  attr_reader :country

  @@all = []

  def initialize(report)
    report.each do |key, value|
     self.class.__send__(:attr_accessor, "#{key}")
     self.send(("#{key}="), value)
   end
   save
  end

  def country=(country)
    raise AssociationTypeMismatchError, "#{country.class} received, Country expected." if !country.is_a?(Country)
    @country = country
    country.add_report(self) unless country.reports.include?(self)

  end

  def save
    @@all << self
  end

  def self.all
     @@all
  end

end
