describe Bank do

  let(:bank) { described_class.new }

  it "Stores a single client" do 
    mock = double("John Doe")
    bank.new_client(mock)
    expect(bank.clients).to eq("John Doe")
  end 
end 