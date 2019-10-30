require_relative 'record'

class Customer < Record
  attr_reader :address

  def initialize(options)
    super(options)
    @address = options[:address]
  end

  def self.csv_headers
    ['id', 'name', 'address']
  end

  def csv_data
    [@id, @name, @address]
  end
end