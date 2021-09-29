describe Client do 

  let (:present_date) {"#{Time.now.day}/#{Time.now.month}/#{Time.now.year}"}
  let (:client) {described_class.new("Johnny Cash")}
  let (:current_client) {described_class.new("Johnny Cash", 50.0)}
  let (:example_transactions) {described_class.new("Johnny Cash", 50.0, [{:date => "28/9/2021", :credit => 10.0,:balance => 10.0}, {:date => "29/9/2021", :debit => 5.0, :balance => 5.0}])}

  #### Instance Edge cases
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
  ###############################################

  describe '#verify_input' do
    
    it "Checks for correct input type" do 
      expect { client.verify_input("money") }.to raise_error "Typing error"
    end 

    it "raises error when less than minimum is deposited or incorrect float is entered" do 
      expect { client.verify_input(0.009) }.to raise_error "You cannot withdraw or deposit less than the minimum"
      expect { client.verify_input(10.5669) }.to raise_error "Credit must be within two decimal places"
    end 

  end 
  ###############################################

  describe "#deposit" do 

    it "Stores credit when called" do 
      client.deposit(10)
      expect(client.balance).to eq(10)
    end
    
    it "saves information inside account statement when cash it deposited" do 
      client.deposit(20.0)
      expect(client.account_statement).to eq([{:date => present_date, :credit => "20.0", :debit => "-", :balance => "20.0"}])
    end

  end 
  ###############################################

  describe "#withdraw" do
    
    it "Subtracts from balance when called" do 
      current_client.withdraw(10)
      expect(current_client.balance).to eq(40)
    end 

    it "raises error when withdraw request exceeds balance" do
      expect { current_client.withdraw(60) }.to raise_error "You do not have required funds"
    end

    it "saves information inside account statement when cash it withdrawn" do 
      current_client.withdraw(5)
      expect(current_client.account_statement).to eq([{:date => present_date, :credit => "-", :debit => "5.0", :balance => "45.0"}])
    end 
  end
  ###############################################
  
  describe "#time_stamp" do

    it "tests time_stamp method" do 
      expect(client.time_stamp).to eq(present_date)
    end

  end
  ###############################################
  
  describe "#print_statement" do 

    table = <<~PUBLISHED
      "   date   ||  credit  ||  debit   || balance  "
      "29/9/2021 ||          ||   5.0    ||   5.0    "
      "28/9/2021 ||   10.0   ||          ||   10.0   "
    PUBLISHED
    
    it "prints transaction history" do
      expect { example_transactions.print_statement }.to output(table).to_stdout
    end 
  
  end 
end 
