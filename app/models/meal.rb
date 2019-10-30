require_relative 'record'

class Meal < Record
  attr_reader :price

  def initialize(options)
    super(options)
    @price = options[:price]
  end

  def self.csv_headers
    ['id', 'name', 'price']
  end

  def csv_data
    [@id, @name, @price]
  end
end