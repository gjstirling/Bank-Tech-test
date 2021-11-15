class Transaction

  def initialize

  end 

  def process(credit, type)
    case type
    when :deposit 
      return {credit: "10.00"}
    end 
  end 

end 