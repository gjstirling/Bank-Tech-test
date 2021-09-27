describe Client do 

  it "Raises Error when new client has no name or incorrect data type is used" do 
    new_account = Client.new("")
    expect { Client.new(123) }.to raise_error "Name information entered incorrectly"
  end 
  
  it "Creates a new client when supplied a name" do 
    new_account = Client.new("John Doe")
    expect(new_account.name).to eq("John Doe")
  end 
end 