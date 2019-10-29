class Customer
  attr_accessor :id
  attr_reader :name, :address

  def initialize(options)
    @id = options[:id]
    @name = options[:name]
    @address = options[:address]
  end
end