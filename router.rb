class Router
  def initialize(controllers = {})
    @meals_controller = controllers[:meals]
    @sessions_controller = controllers[:sessions]

    @running = true
  end

  def run
    loggedin_employee = @sessions_controller.login
    puts "Welcome to the Food Delivery App! #{loggedin_employee.username}"
    puts "           --           "

    # AUTHORIZATION
    if loggedin_employee.manager?
      while @running
        display_manager_tasks
        action = gets.chomp.to_i
        print `clear`
        route_manager_action(action)
      end
    else
      while @running
        display_delivery_guy_tasks
        action = gets.chomp.to_i
        print `clear`
        route_delivery_action(action)
      end
    end
  end

  private

  def route_manager_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.add
    when 9 then stop
    else
      puts "Please press 1, 2, 3 or 4"
    end
  end

  def route_delivery_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.add
    when 9 then stop
    else
      puts "Please press 1, 2, 3 or 4"
    end
  end 

  def stop
    @running = false
  end

  def display_delivery_guy_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - View my undelivered orders"
    puts "2 - Mark an order as delivered"
    puts "9 - Stop and exit the program"
  end

  def display_manager_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all meals"
    puts "2 - Add new meal"
    puts "9 - Stop and exit the program"
  end
end
