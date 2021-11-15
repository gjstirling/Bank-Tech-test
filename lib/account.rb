class Account
  
  def initialize(balance = 0)
    @balance = balance
  end 

  def deposit(credit)
    @balance += credit
    @balance.round(2) 
  end
  
  def withdraw(credit)
    @balance -= credit 
    @balance.round(2)
  end 

end 