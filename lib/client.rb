class Client

  attr_reader :name 

  def initialize(name, balance = 0)
    fail "Name information entered incorrectly" if !name.is_a?(String)
    fail "Name required to create account" if name.strip == ""
    @name = name
    @balance = balance
  end 
end 