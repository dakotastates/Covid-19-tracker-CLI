class Report

  @@all = []

  def initialize(report)
    report.each do |key, value|
     self.class.__send__(:attr_accessor, "#{key}")
     self.send(("#{key}="), value)
   end
   save
  end

  def save
    @@all << self
  end

  def self.all
     @@all
  end

end
