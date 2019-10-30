# requiring all files for sessions
require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/sessions_controller'

# requiring all files for sessions
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'

require_relative 'router'

employee_repository = EmployeeRepository.new('data/employees.csv')
sessions_controller = SessionsController.new(employee_repository)

meal_repository = MealRepository.new('data/meals.csv')
meals_controller = MealsController.new(meal_repository)

router = Router.new(
  meals: meals_controller,
  sessions: sessions_controller
)

router.run


# User stories
# As a user I can list all meals X
# As a user I can add a meal X

# List all customers available in the restaurant X
# Add a new customer X

# As an employee, I can log in