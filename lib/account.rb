class Account
  
  def initialize(balance = 0)
    @balance = balance
  end 

  def deposit(credit)
    @balance += credit
    @balance.round(2) 
  end
  
  def withdraw(credit)
    raise "Insufficient funds" unless @balance > credit
    @balance -= credit 
    @balance.round(2)
  end 

end 