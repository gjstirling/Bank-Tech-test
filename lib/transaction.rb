class Transaction

  attr_reader :minimum, :details, :present_balance

  def initialize(present_balance, minimum = 0.01)
    @present_balance = present_balance
    @minimum = minimum
    @details = Hash.new
  end

  def verify_input(value)
    raise 'Typing error' unless value.is_a? Numeric
    raise 'You cannot withdraw or deposit less than the minimum' if value < minimum
    raise 'Credit must be within two decimal places' if value.to_s.split('.').last.size > 2

    value.to_f
  end

  def time_stamp
    "#{Time.now.day}/#{Time.now.month}/#{Time.now.year}"
  end

  def deposit(credit)
    credit = verify_input(credit)
    @details.merge!(:date => time_stamp, :credit => credit, debit: '-')
  end

  def withdraw(credit)
    credit = verify_input(credit)
    raise 'Insufficient funds to complete withdrawel' if credit > @present_balance
    @details.merge!(:date => time_stamp, :credit => "-", debit: credit) 
  end

end 