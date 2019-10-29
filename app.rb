# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'router'

meal_repository = MealRepository.new('data/meals.csv')
meals_controller = MealsController.new(meal_repository)
router = Router.new(meals_controller)

router.run


# User stories
# As a user I can list all meals X
# As a user I can add a meal X

# List all customers available in the restaurant
# Add a new customer