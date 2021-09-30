describe Transaction do

  let(:transaction) { described_class.new(10) }
  let(:present_date) { "#{Time.now.day}/#{Time.now.month}/#{Time.now.year}" }
  
  ###############################################

  describe '#verify_input' do
    it 'Checks for correct input type' do
      expect { transaction.verify_input('money') }.to raise_error 'Typing error'
    end

    it 'raises error when less than minimum is deposited or incorrect float is entered' do
      expect { transaction.verify_input(0.009) }.to raise_error 'You cannot withdraw or deposit less than the minimum'
      expect { transaction.verify_input(10.5669) }.to raise_error 'Credit must be within two decimal places'
    end
  end
  ###############################################

  describe '#deposit' do
    it 'Stores credit inside details when called' do
      transaction.deposit(10)
      expect(transaction.details).to eq({:date => present_date, :credit => 10, debit: '-'})
    end
  end

  ################################################

  describe '#withdraw' do
    it 'Stores debit inside details when called' do
      transaction.withdraw(10)
      expect(transaction.details).to eq({:date => present_date, :credit => "-", debit: 10})
    end

    it "raises error when balance is too low to withdraw" do 
      expect { transaction.withdraw(11) }.to raise_error 'Insufficient funds to complete withdrawel'
    end 
  end

  ###############################################

  describe '#time_stamp' do
    it 'tests time_stamp method' do
      expect(transaction.time_stamp).to eq(present_date)
    end
  end

end