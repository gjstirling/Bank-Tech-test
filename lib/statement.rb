# frozen_string_literal: true

# top-level documentation comment
class Statement
  def self.print(data)
    p 'date || credit || debit || balance'
    data.reverse.each do |t|
      p "#{t[:date]} ||#{format(t[:credit])}||#{format(t[:debit])}||#{format_balance(t[:balance])}"
    end
  end

  def self.format(number)
    return ' ' if number.zero?
    return " #{number.round(2)}0 " if add_zero?(number)

    " #{number.round(2)} "
  end

  def self.format_balance(balance)
    balance = balance.to_s.split('')
    length = balance.length
    " #{balance.take(length - 2).join}.#{balance.drop(length - 2).join} "
  end
end

private

def add_zero?(number)
  number.round(2).to_s.split('.').last.length < 2
end
