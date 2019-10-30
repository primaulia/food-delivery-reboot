require_relative 'record'

class Employee < Record
  attr_reader :username, :password, :role

  def initialize(options)
    super(options)

    @username = options[:username]
    @password = options[:password]
    @role = options[:role]
  end

  def manager?
    # prove that this instance role is a manager
    @role == 'manager'
  end

  def delivery_guy?
    # prove that this instance role is NOT a manager
    !manager?
  end

  def self.csv_headers
    ['id', 'username', 'password', 'role']
  end

  def csv_data
    [@id, @username, @password, @role]
  end
end