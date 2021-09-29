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
    verify_input(credit)
    @balance += credit.to_f
    account_statement.push({:date => time_stamp, :credit => credit.to_s, :debit => "-", :balance => @balance.to_s})
    "#{credit} deposited"
  end 

  def withdraw(credit)
    verify_input(credit)
    fail "You do not have required funds" if credit > balance
    @balance -= credit.to_f
    account_statement.push({:date => time_stamp, :credit => "-", :debit => credit.to_f.to_s, :balance => @balance.to_s})
    "#{credit} withdrawn"
  end 

  def time_stamp
    "#{Time.now.day}/#{Time.now.month}/#{Time.now.year}"  
  end 
  
  def verify_input(value)
    fail "Typing error" unless value.is_a? Numeric 
    fail "You cannot withdraw or deposit less than the minimum" if value < minimum
  end

  def print_statement
    p ("date".center(10) + "||" + "credit".center(10) + "||" + "debit".center(10) + "||" + "balance".center(10)) 
    account_statement.reverse.each do |n|
      p ("#{n[:date]}".center(10) + "||" + "#{n[:credit]}".center(10) + "||" + "#{n[:debit]}".center(10) + "||" + "#{n[:balance]}".center(10))  
    end 
  end 

end 
