class Client

  attr_reader :name 

  def initialize(name, balance = 0)
    fail "Name information entered incorrectly" if !name.is_a?(String) 
    @name = name
    @balance = balance
  end 
end 