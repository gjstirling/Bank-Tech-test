class Statement

  def self.print(transactions)
    p ("#{'date'.center(10)}||#{'credit'.center(10)}||#{'debit'.center(10)}||#{'balance'.center(10)}")
    transactions.reverse.each do |transaction| 
      p "#{transaction[:date]}".center(10) + "||" + "#{format(transaction[:credit])}".center(10) + "||" + "#{format(transaction[:debit])}".center(10) + "||" + "#{format(transaction[:balance])}".center(10) 
    end 
  end 

  def self.format(number)
    return "0.00" if number == 0
    return number.round(2).to_s + "0" if add_zero?(number)
    return number.round(2).to_s
  end 

end 

private 

def add_zero?(number) 
  number.round(2).to_s.split(".").last.length < 2
end 