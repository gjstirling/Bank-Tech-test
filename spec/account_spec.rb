# frozen_string_literal: true

describe Account do

  it 'creates a new account' do
    expect(subject).to be_an_instance_of(Account)
  end

  describe '#deposit' do
    it 'can deposit credit' do
      Timecop.freeze(Time.parse('10/11/2021')) do 
        expect(subject.deposit(10.0)).to eq([{ date: "10/11/2021", debit: 0, credit: 10.0, balance: 10.0 }])
        expect(subject.deposit(15.51)).to eq([{ date: "10/11/2021", debit: 0, credit: 10.0, balance: 10.0 },
                                              { date: "10/11/2021", debit: 0, credit: 15.51, balance: 25.51 }])
      end     
    end

    it 'raises an error if non numeric input is given' do
      expect { subject.deposit('money') }.to raise_error 'Typing error'
    end

    it 'raises an error if credit is less than the minumum value' do
      expect { subject.deposit(0.009) }.to raise_error 'Cannot withdraw/deposit less than the minumum'
    end
  end

  describe '#withdraw' do
    let(:account_w_credit) { Account.new(15.0) }

    it 'can withdraw credit' do
      Timecop.freeze(Time.parse('14/01/2012')) do
        expect(account_w_credit.withdraw(5.0)).to eq([{ date: "14/01/2012", debit: 5.0, credit: 0, balance: 10.0 }])
      end
    end

    it 'raises error when balance is too low' do
      expect { subject.withdraw(5.0) }.to raise_error 'Insufficient funds'
    end
  end
end
