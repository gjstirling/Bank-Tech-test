# frozen_string_literal: true

class Statement
  def self.print(data)
    p "date || credit || debit || balance"
    data.reverse.each do |t|
      p "#{(t[:date])} ||#{format(t[:credit])}||#{format(t[:debit])}||#{format_balance(t[:balance])}"
    end
  end

  def self.format(number)
    return ' ' if number.zero?
    return " #{number.round(2)}0 " if add_zero?(number)

    " #{number.round(2).to_s} "
  end

  def self.format_balance(balance)
    array = balance.to_s.split("")
    " #{array.take(array.length-2).join}.#{array.drop(2).join} "
  end 
end

private

def add_zero?(number)
  number.round(2).to_s.split('.').last.length < 2
end
