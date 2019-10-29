require 'csv'
require_relative '../models/customer'

class CustomerRepository
  def initialize(file_path)
    @file_path = file_path
    @customers = []
    @next_id = 1

    read_csv if File.exist?(@file_path)
  end

  def all
    @customers
  end

  def add(new_customer)
    new_customer.id = @next_id
    @customers << new_customer
    @next_id += 1

    write_csv
  end

  private

  def read_csv
    csv_options = {
      headers: :first_row, #set the header in row, so not array anymore
      header_converters: :symbol # convert the key into symbol, not a string
    }

    CSV.foreach(@file_path, csv_options) do |row|
      # the type of each state
      row[:id]    = row[:id].to_i          # Convert column to Integer
      
      @customers << Customer.new(row)
    end

    @next_id = @customers.last.id + 1
  end

  def write_csv
    csv_options = {
      force_quotes: true
    }

    CSV.open(@file_path, 'wb', csv_options) do |csv|
      csv << ['id', 'name', 'address']

      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end