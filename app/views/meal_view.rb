 class MealView
  def display_all(all_meals)
    all_meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name} ($#{meal.price})"
    end
  end

  def ask_for_name
    puts "What's the meal name?"
    gets.chomp
  end

  def ask_for_price
    puts "What's the meal price?"
    gets.chomp.to_i
  end
end