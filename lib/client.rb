# frozen_string_literal: true

# Client class
class Client
  attr_reader 

  def initialize
  
  end

  def deposit(credit)
    credit = verify_input(credit)
    @balance += credit
    account_statement.push({ date: time_stamp, credit: convert(credit), debit: '-',
                             balance: convert(@balance) })
  end

  def withdraw(credit)
    credit = verify_input(credit)
    raise 'You do not have required funds' if credit > balance

    @balance -= credit
    account_statement.push({ date: time_stamp, credit: '-', debit: convert(credit),
                             balance: convert(@balance) })
  end

  def time_stamp
    "#{Time.now.day}/#{Time.now.month}/#{Time.now.year}"
  end

  def verify_input(value)
    raise 'Typing error' unless value.is_a? Numeric
    raise 'You cannot withdraw or deposit less than the minimum' if value < minimum
    raise 'Credit must be within two decimal places' if value.to_s.split('.').last.size > 2

    value.to_f
  end

  def print_statement
    p("#{'date'.center(10)}||#{'credit'.center(10)}||#{'debit'.center(10)}||#{'balance'.center(10)}")
    account_statement.reverse.each do |n|
      p("#{(n[:date]).to_s.center(10)}||#{(n[:credit])
      .center(10)}||#{(n[:debit])
      .center(10)}||#{(n[:balance]).to_s
      .center(10)}")
    end
  end

  def convert(number)
    return number.to_s if number.to_s.split('.').last.size == 2
    return "#{number}0" if number.to_s.split('.').last.size == 1
  end
end
