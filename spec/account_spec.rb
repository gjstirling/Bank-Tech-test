describe Account do 
  it 'creates a new account' do 
    expect(subject).to be_an_instance_of(Account)
  end 

  describe '#deposit' do 

    it 'can return a transaction' do 
      expect(subject.deposit(10.00)).to eq ({credit: "0", debit: "10.00", balance: "10.00"})
    end 
  end 

end 
