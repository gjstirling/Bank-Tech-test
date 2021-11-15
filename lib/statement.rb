# frozen_string_literal: true

class Statement
  def self.print(data)
    p("#{'date'.center(10)}||#{'credit'.center(10)}||#{'debit'.center(10)}||#{'balance'.center(10)}")
    data.reverse.each do |t|
      p "#{(t[:date]).to_s.center(10)}||#{format(t[:credit]).to_s.center(10)}||#{format(t[:debit]).to_s.center(10)}||#{format(t[:balance]).to_s.center(10)}"
    end
  end

  def self.format(number)
    return '0.00' if number.zero?
    return "#{number.round(2)}0" if add_zero?(number)

    number.round(2).to_s
  end
end

private

def add_zero?(number)
  number.round(2).to_s.split('.').last.length < 2
end
