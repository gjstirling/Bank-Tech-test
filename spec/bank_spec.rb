describe Bank do

  let (:bank) {described_class.new}
  let (:client1) { double "John Doe"}
  let (:client2) { double "Johnny Cash"}

  it "stores a client inside clients array" do 
    bank.new_client(:client1)
    expect(bank.clients).to eq([:client1])
  end 

  it "stores multiple clients" do 
    bank.new_client(:client1)
    bank.new_client(:client2)
    expect(bank.clients).to eq([:client1, :client2])
  end 

end 