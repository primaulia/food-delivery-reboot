require 'io/console'

class SessionView
  def ask_for_username
    puts "username?"
    gets.chomp
  end

  def ask_for_password
    puts "password?"
    STDIN.noecho(&:gets).chomp
  end
end