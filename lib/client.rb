class Client

  attr_reader :name, :balance

  def initialize(name)
    fail "Name information entered incorrectly" if !name.is_a?(String)
    fail "Name required to create account" if name.strip == ""
    fail "Name cannot contain numbers or special characters" if name.gsub(/[^a-zA-Z \.']/,'').length < name.length
    @name = name
    @balance = 0
  end 

  def deposit(credit)
    fail "Typing error" unless credit.is_a? Numeric 
    @balance += credit
  end 

end 

