describe Transaction do

  let(:transaction) { described_class.new }
  
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

  # describe '#deposit' do
  #   it 'Stores credit when called' do
  #     client.deposit(10)
  #     expect(client.balance).to eq(10)
  #   end

  #   it 'saves information inside account statement when cash it deposited' do
  #     client.deposit(20.0)
  #     expect(client.account_statement).to eq([{ date: present_date, credit: '20.00', debit: '-',
  #                                               balance: '20.00' }])
  #   end
  # end
  # ###############################################

  # describe '#withdraw' do
  #   it 'Subtracts from balance when called' do
  #     current_client.withdraw(10)
  #     expect(current_client.balance).to eq(40)
  #   end

  #   it 'raises error when withdraw request exceeds balance' do
  #     expect { current_client.withdraw(60) }.to raise_error 'You do not have required funds'
  #   end

  #   it 'saves information inside account statement when cash it withdrawn' do
  #     current_client.withdraw(5)
  #     expect(current_client.account_statement).to eq([{ date: present_date, credit: '-', debit: '5.00',
  #                                                       balance: '45.00' }])
  #   end
  # end
  # ###############################################

  # describe '#time_stamp' do
  #   it 'tests time_stamp method' do
  #     expect(client.time_stamp).to eq(present_date)
  #   end
  # end

end