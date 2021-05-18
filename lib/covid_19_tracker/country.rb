class Country

  @@all = []

  def initialize(data)
    data[1].each do |key, value|
     self.class.__send__(:attr_accessor, "#{key}")
     self.send(("#{key}="), value)
   end
   @reports = []
   add_report
    save
  end

  def reports
    @reports.dup.freeze
  end

  def last_report
    @reports.last
  end

  def add_report(r= nil)
    self.data.collect do |report|
      r = Report.new(report)
      raise AssociationTypeMismatchError, "#{r.class} received, Report expected." if !r.is_a?(Report)
      @reports << r
      r.country = self unless r.country == self
    end
  end

  def save
    @@all << self
  end

  def self.all
     @@all
  end

  def self.all_sorted
    excluded = ["World", "Asia", "North America", "Europe", "South America", "Austrailia", "Africa", "European Union"]
     @@all.reject {|country| excluded.include?(country.location) }
  end

end
