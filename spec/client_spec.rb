describe Client do 

  let (:present_date) {"#{Time.now.day}/#{Time.now.month}/#{Time.now.year}"}
  let (:client) {described_class.new("Johnny Cash")}
  let (:current_client) {described_class.new("Johnny Cash", 50)}
  let (:example_transactions) {described_class.new("Johnny Cash", 50, [{:date => present_date, :credit => 10,:balance => 10}, {:date => present_date, :debit => 5, :balance => 5}])}

  it "Raises Error when incorrect data type is used" do 
    expect { Client.new(123) }.to raise_error "Name information entered incorrectly"
  end 

  it "Raises error when no name is given" do 
    expect { Client.new("") }.to raise_error "Name required to create account"
    expect { Client.new("   ") }.to raise_error "Name required to create account"
  end 
  
  it "Gives error is string entered doesn't appear correct" do 
    expect { Client.new("J0hn Do3!") }.to raise_error "Name cannot contain numbers or special characters"
  end  
  
  it "Creates a new client when supplied a name" do 
    new_account = Client.new("John Doe")
    expect(new_account.name).to eq("John Doe")
  end 

  describe '#verify_input' do
    
    it "Checks for correct input type" do 
      expect { client.verify_input("money") }.to raise_error "Typing error"
    end 

    it "raises error when zero is deposited" do 
      expect { client.verify_input(0.001) }.to raise_error "You cannot withdraw or deposit less than the minimum"
    end 

  end 
  
  describe "#deposit" do 

    it "Stores credit when called" do 
      client.deposit(10)
      expect(client.balance).to eq(10)
    end 
  end 

  describe "#withdraw" do
    
    it "Subtracts from balance when called" do 
      current_client.withdraw(10)
      expect(current_client.balance).to eq(40)
    end 

    it "raises error when withdraw request exceeds balance" do
      expect { current_client.withdraw(60) }.to raise_error "You do not have required funds"
    end
  end

  describe '#save_transaction' do 

    it "saves information inside account statement" do 
      client.deposit(10)
      client.withdraw(5)
      expect(client.account_statement).to eq([{:date => present_date, :credit => 10, :balance => 10}, {:date => present_date, :debit => 5, :balance => 5}])
    end 

  end 

  describe "print_statement" do 

    it "Creates header for table" do 
      header = "date".ljust(10) + "||" + "credit".ljust(10) + "||" + "debit".ljust(10) + "||" + "balance".ljust(10)
      transaction1 = present_date.ljust(10) + "||" "10".ljust(10) + "||" "".ljust(10) + "||" + "10".ljust(10) 
      transaction2 =  present_date.ljust(10) + "||" "".ljust(10) + "||" "5".ljust(10) + "||" + "5".ljust(10) 
      expect(example_transactions.print_statement).to eq(header + "\n" + transaction2 + "\n" + transaction1)
    end 

  end 

end 
