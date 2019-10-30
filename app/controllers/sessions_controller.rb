require_relative '../views/session_view'

class SessionsController
  def initialize(employee_repo)
    @repo = employee_repo
    @view = SessionView.new
  end

  def login
    # AUTHENTICATION
    username = @view.ask_for_username
    employee = @repo.find_by_username(username)

    unless employee.nil?
      given_password = @view.ask_for_password

      if employee.password == given_password 
        return employee
      else
        puts "Wrong credentials... Try again!"
        login # recursion
      end
      
    else
      puts "Wrong credentials... Try again!"
      login
    end
  end
end