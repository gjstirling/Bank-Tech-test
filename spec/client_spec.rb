describe Client do 

  let (:client) {described_class.new("Johnny Cash")}

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

  describe "#deposit" do 

    it "Stores money when called" do 
      client.deposit(49.99)
      expect(client.balance).to eq(49.99)

    end 
  end 
  
end 