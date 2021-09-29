class Client

  attr_reader :name, :balance, :minimum, :account_statement

  def initialize(name, balance = 0, account_statement = [], minimum = 0.01)
    fail "Name information entered incorrectly" if !name.is_a?(String)
    fail "Name required to create account" if name.strip == ""
    fail "Name cannot contain numbers or special characters" if name.gsub(/[^a-zA-Z \.']/,'').length < name.length
    @name = name
    @balance = balance
    @account_statement = account_statement
    @minimum = minimum
  end 

  def deposit(credit)
    credit = verify_input(credit)
    @balance += credit
    account_statement.push({:date => time_stamp, :credit => convert(credit), :debit => "-", :balance => convert(@balance)})
    "#{credit} deposited"
  end 

  def withdraw(credit)
    credit = verify_input(credit)
    fail "You do not have required funds" if credit > balance
    @balance -= credit
    account_statement.push({:date => time_stamp, :credit => "-", :debit => convert(credit), 
      :balance => convert(@balance)})
    "#{credit} withdrawn"
  end 

  def time_stamp
    "#{Time.now.day}/#{Time.now.month}/#{Time.now.year}"  
  end 
  
  def verify_input(value)
    fail "Typing error" unless value.is_a? Numeric 
    fail "You cannot withdraw or deposit less than the minimum" if value < minimum
    fail "Credit must be within two decimal places" if value.to_s.split('.').last.size > 2
    value.to_f
  end

  def print_statement
    p ("date".center(10) + "||" + "credit".center(10) + "||" + "debit".center(10) + "||" + "balance".center(10)) 
    account_statement.reverse.each do |n|
      p ("#{n[:date]}".center(10) + "||" + "#{n[:credit]}".center(10) + "||" + "#{n[:debit]}".center(10) + "||" + "#{n[:balance]}".center(10))  
    end 
  end 

  def convert(number)
    return number.to_s if number.to_s.split('.').last.size == 2
    return (number.to_s + "0") if number.to_s.split('.').last.size == 1
  end 

end 
