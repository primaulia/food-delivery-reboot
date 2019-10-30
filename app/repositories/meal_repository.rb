require 'csv'
require_relative '../models/meal'
require_relative 'base_repository'


class MealRepository < BaseRepository 
  private

  # parent will setup the steps to read the csv
  def build_model(row)
    row[:id]    = row[:id].to_i          # Convert column to Integer
    row[:price] = row[:price].to_i        # Convert column to Integer
    new_instance = Meal.new(row)
    return new_instance
  end
end