require 'csv'
require_relative '../models/meal'

class MealRepository
  def initialize(file_path)
    @file_path = file_path
    @meals = []
    @next_id = 1

    read_csv if File.exist?(@file_path)
  end

  def all
    @meals
  end

  def add(new_meal)
    new_meal.id = @next_id
    @meals << new_meal
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
      row[:price] = row[:price].to_i        # Convert column to Integer
      

      @meals << Meal.new(row)
    end

    @next_id = @meals.last.id + 1
  end

  def write_csv
    csv_options = {
      force_quotes: true
    }

    CSV.open(@file_path, 'wb', csv_options) do |csv|
      csv << ['id', 'name', 'price']

      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end