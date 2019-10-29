class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(options)
    @id = options[:id]
    @name = options[:name]
    @price = options[:price]
  end
end