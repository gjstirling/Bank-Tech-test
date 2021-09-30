class Transaction

  attr_reader :minimum

  def initialize(minimum = 0.01)
    @minimum = minimum
  end

  def verify_input(value)
    raise 'Typing error' unless value.is_a? Numeric
    raise 'You cannot withdraw or deposit less than the minimum' if value < minimum
    raise 'Credit must be within two decimal places' if value.to_s.split('.').last.size > 2

    value.to_f
  end

end 