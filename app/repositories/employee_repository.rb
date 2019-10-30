require 'csv'
require_relative '../models/employee'
require_relative 'base_repository'


class EmployeeRepository < BaseRepository
  undef :add

  def find_by_username(given_username)
    @elements.find do |element|
      element.username == given_username
    end
  end

  private

  # parent will setup the steps to read the csv
  def build_model(row)
    row[:id] = row[:id].to_i     # Convert column to Integer
    new_instance = Employee.new(row)
    return new_instance
  end
end