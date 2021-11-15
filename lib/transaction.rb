class Transaction

  def initialize

  end 

  def process(credit, type)
    case type
    when :deposit 
      if credit.to_s.length == 4 
        credit = credit.to_s + "0"
      end 
      return {credit: credit.to_s}
    end 
  end 

end


private 

