# frozen_string_literal: true

require_relative 'statement'

class Account
  def initialize(balance = 0, transactions = [])
    @balance = balance
    @transactions = transactions
  end

  def deposit(credit)
    verify_input(credit)
    @balance += credit
    @transactions << { 
      date: today, debit: 0, credit: credit, balance: @balance.round(2) 
    }
  end

  def withdraw(credit)
    verify_input(credit)
    raise 'Insufficient funds' unless @balance > credit

    @balance -= credit
    @transactions << { 
      date: today, debit: credit, credit: 0, balance: @balance.round(2) 
    }
  end

  def statement
    Statement.print(@transactions)
  end
end

private

MINIMUM = 0.01
DATE_FORMAT = '%d/%m/%Y'

def verify_input(value)
  raise 'Typing error' unless value.is_a? Numeric
  raise "Transaction must be greater than #{MINIMUM}" if value < MINIMUM
end

def today
  Time.now.strftime(DATE_FORMAT)
end
