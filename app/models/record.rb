class Record
  attr_accessor :id
  attr_reader :name

  def initialize(options)
    @id = options[:id]
    @name = options[:name]
  end
end