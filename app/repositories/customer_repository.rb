require 'csv'
require_relative '../models/customer'
require_relative 'base_repository'


class CustomerRepository < BaseRepository
  
  private

  # parent will setup the steps to read the csv
  def build_model(row)
    row[:id]    = row[:id].to_i          # Convert column to Integer
    new_instance = Customer.new(row)
    return new_instance
  end
end