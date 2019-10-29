require_relative '../views/meal_view'

class MealsController
  def initialize(meal_repo)
    @repo = meal_repo
    @view = MealView.new
  end

  def list
    # get all meals from repo
    all_meals = @repo.all
    # display that to view
    @view.display_all(all_meals)
  end

  def add
    # ask user for meal name -> view
    name = @view.ask_for_name
    # ask user for meal price -> view
    price = @view.ask_for_price

    new_meal = Meal.new(
      name: name,
      price: price
    )

    # push to the repo
    @repo.add(new_meal)
  end
end