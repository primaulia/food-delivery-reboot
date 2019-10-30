require 'csv'
require 'pry-byebug'

class BaseRepository
  def initialize(file_path)
    @file_path = file_path
    @elements = []
    @next_id = 1

    read_csv if File.exist?(@file_path)
  end

  def all
    @elements
  end

  def add(new_instance)
    new_instance.id = @next_id # serialization
    @elements << new_instance
    @next_id += 1

    write_csv
  end

  def find(given_id)
    @elements.find do |element|
      element.id == given_id
    end
  end

  private

  def read_csv
    csv_options = {
      headers: :first_row, #set the header in row, so not array anymore
      header_converters: :symbol # convert the key into symbol, not a string
    }

    CSV.foreach(@file_path, csv_options) do |row|
      # the build model process, parent doesnt know
      # how to do it
      # delegate the task to the subclass

      @elements << build_model(row)
    end

    @next_id = @elements.last.id + 1
  end

  def write_csv
    csv_options = {
      force_quotes: true
    }

    CSV.open(@file_path, 'wb', csv_options) do |csv|
      # binding.pry
      csv << @elements.first.class.csv_headers # someone needs to do this ==> depending on the model you're trying to write to the csv

      @elements.each do |element|
        csv << element.csv_data # someone needs to do this
      end
    end
  end
end



