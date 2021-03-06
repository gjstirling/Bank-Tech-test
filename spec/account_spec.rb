# frozen_string_literal: true

describe Account do
  describe '#deposit' do
    let(:deposit1) do
      [{ date: '10/11/2021', debit: 0, credit: 10.0, balance: 1000 }]
    end
    let(:deposit2) do
      [{ date: '10/11/2021', debit: 0, credit: 10.0, balance: 1000 },
       { date: '10/11/2021', debit: 0, credit: 15.51, balance: 2551 }]
    end

    it 'can deposit credit' do
      Timecop.freeze(Time.parse('10/11/2021')) do
        expect(subject.deposit(10.0)).to eq(deposit1)
        expect(subject.deposit(15.51)).to eq(deposit2)
      end
    end

    it 'raises an error if non numeric input is given' do
      expect { subject.deposit('money') }.to raise_error 'Typing error'
    end

    it 'raises an error if the credit is not in pounds/pence or less than the minumum value' do
      expect { subject.deposit(13.456) }.to raise_error 'Deposit must be in pounds & pence'
      expect { subject.deposit(0.009) }.to raise_error "Transaction must be greater than #{MINIMUM}"
    end
  end

  describe '#withdraw' do
    let(:account_w_credit) { Account.new(1500) }

    it 'can withdraw credit' do
      Timecop.freeze(Time.parse('14/01/2012')) do
        transaction = { date: '14/01/2012', debit: 5.0, credit: 0, balance: 1000 }
        expect(account_w_credit.withdraw(5.0)).to eq([transaction])
      end
    end

    it 'raises error when balance is too low' do
      expect { subject.withdraw(5.0) }.to raise_error 'Insufficient funds'
    end
  end
end
