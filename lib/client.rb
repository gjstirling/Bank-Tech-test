# frozen_string_literal: true

# Client class
class Client
  attr_reader 

  def initialize
  
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
