class Client

  attr_reader :name, :balance, :mininmum, :account_statement

  def initialize(name, balance = 0)
    fail "Name information entered incorrectly" if !name.is_a?(String)
    fail "Name required to create account" if name.strip == ""
    fail "Name cannot contain numbers or special characters" if name.gsub(/[^a-zA-Z \.']/,'').length < name.length
    @name = name
    @balance = balance
    @mininmum = 0.01
    @account_statement = []
  end 

  def deposit(credit)
    verify_input(credit)
    @balance += credit
    timestamp = "#{Time.now.day}/#{Time.now.month}/#{Time.now.year}"
    account_statement.push({:deposit => credit, :date => timestamp})
  end 

  def withdraw(credit)
    verify_input(credit)
    fail "You do not have required funds" if credit > balance
    @balance -= credit
    account_statement.push({:withdraw => credit})
  end 

  def verify_input(value)
    fail "Typing error" unless value.is_a? Numeric 
    fail "You cannot withdraw or deposit less than the minimum" if value < mininmum
  end

end 

