# frozen_string_literal: true

describe Client do
  let(:present_date) { "#{Time.now.day}/#{Time.now.month}/#{Time.now.year}" }
  let(:client) { described_class.new('Johnny Cash') }
  let(:current_client) { described_class.new('Johnny Cash', 50.0) }


  ###############################################

  describe '#verify_input' do
    it 'Checks for correct input type' do
      expect { client.verify_input('money') }.to raise_error 'Typing error'
    end

    it 'raises error when less than minimum is deposited or incorrect float is entered' do
      expect { client.verify_input(0.009) }.to raise_error 'You cannot withdraw or deposit less than the minimum'
      expect { client.verify_input(10.5669) }.to raise_error 'Credit must be within two decimal places'
    end
  end
  ###############################################

  describe '#deposit' do
    it 'Stores credit when called' do
      client.deposit(10)
      expect(client.balance).to eq(10)
    end

    it 'saves information inside account statement when cash it deposited' do
      client.deposit(20.0)
      expect(client.account_statement).to eq([{ date: present_date, credit: '20.00', debit: '-',
                                                balance: '20.00' }])
    end
  end
  ###############################################

  describe '#withdraw' do
    it 'Subtracts from balance when called' do
      current_client.withdraw(10)
      expect(current_client.balance).to eq(40)
    end

    it 'raises error when withdraw request exceeds balance' do
      expect { current_client.withdraw(60) }.to raise_error 'You do not have required funds'
    end

    it 'saves information inside account statement when cash it withdrawn' do
      current_client.withdraw(5)
      expect(current_client.account_statement).to eq([{ date: present_date, credit: '-', debit: '5.00',
                                                        balance: '45.00' }])
    end
  end
  ###############################################

  describe '#time_stamp' do
    it 'tests time_stamp method' do
      expect(client.time_stamp).to eq(present_date)
    end
  end
  ###############################################

  describe '#print_statement' do
    let(:example_transactions) do
      described_class.new('Johnny Cash', 0,
                          [{ date: '28/9/2021', credit: '10.00', debit: '-', balance: '10.00' },
                           { date: '29/9/2021', credit: '-', debit: '5.00', balance: '5.00' }])
    end

    table = <<~PUBLISHED
      "   date   ||  credit  ||  debit   || balance  "
      "29/9/2021 ||    -     ||   5.00   ||   5.00   "
      "28/9/2021 ||  10.00   ||    -     ||  10.00   "
    PUBLISHED

    it 'prints transaction history' do
      expect { example_transactions.print_statement }.to output(table).to_stdout
    end
  end
  ###############################################

  describe '#convert' do
    it 'converts numbers into correct format for printing to console' do
      expect(client.convert(10.9)).to eq('10.90')
    end
  end
end
