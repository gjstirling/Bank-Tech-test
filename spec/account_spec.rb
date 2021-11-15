describe Account do 
  it 'creates a new account' do 
    expect(subject).to be_an_instance_of(Account)
  end 

  describe '#deposit' do 

    it 'can deposit credit' do
      expect(subject.deposit(10.0)).to eq(10.0)
      expect(subject.deposit(15.51)).to eq(25.51)
    end 

  end 

  describe '#withdraw' do 

    let(:account_w_credit) {Account.new(15.0)}

    it 'can withdraw credit' do
      expect(account_w_credit.withdraw(5.0)).to eq(10.0)   
    end
    
    it 'raises error when balance is too low' do 
      expect {subject.withdraw(5.0)}.to raise_error "Insufficient funds"
    end 
  end 

end 
