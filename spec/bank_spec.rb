describe Bank do

  let (:bank) {described_class.new}
  let (:client_class) { double :client_class }
  let (:client_instance) { double :client_instance, name: "John Doe" }

  it "stores a client inside clients array" do 
    allow(client_class).to receive(:new).and_return(client_instance)
    bank.new_client("John Doe", client_class)
    expect(bank.clients).to eq([client_instance])
  end 

  it "stores multiple clients" do 
    allow(client_class).to receive(:new).and_return(client_instance)
    bank.new_client("John Doe", client_class)
    allow(client_class).to receive(:new).and_return(client_instance)
    bank.new_client("Johnny Cash", client_class)
    expect(bank.clients).to eq([client_instance, client_instance])
  end 

end 