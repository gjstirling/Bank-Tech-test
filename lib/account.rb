class Account
  
  def initialize(balance = 0)
    @balance = balance
  end 

  def deposit(credit)
    verify_input(credit)
    @balance += credit
    @balance.round(2) 
  end
  
  def withdraw(credit)
    verify_input(credit)
    raise "Insufficient funds" unless @balance > credit
    @balance -= credit 
    @balance.round(2)
  end 

end 

private 

MINIMUM = 0.01

def verify_input(value)
  raise 'Typing error' unless value.is_a? Numeric
  raise "Cannot withdraw/deposit less than the minumum" if value < MINIMUM
end 