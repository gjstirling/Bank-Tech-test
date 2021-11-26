# frozen_string_literal: true

describe Statement do
  let(:date) { Time.freeze.strftime('%d-%m-%y') }

  describe '#print' do
    let(:transaction) { [{ date: today, debit: 0, credit: 10.0, balance: 10.0 }] }
    let(:sample_transactions) do
      [{ date: today, debit: 0, credit: 20.0, balance: 20.0 }, { date: today, debit: 10.00, credit: 0, balance: 10.0 },
       { date: today, debit: 0, credit: 6.57, balance: 16.57 }]
    end

    it 'prints statement header' do
      expect { Statement.print([]) }.to output("\"   date   ||  credit  ||  debit   || balance  \"\n").to_stdout
    end

    it 'prints a single transaction' do
      table = <<~PUBLISHED
        "   date   ||  credit  ||  debit   || balance  "
        " #{today} ||  10.00   ||   0.00   ||  10.00   "
      PUBLISHED

      expect { Statement.print(transaction) }.to output(table).to_stdout
    end

    it 'prints multiple transactions' do
      table = <<~PUBLISHED
        "   date   ||  credit  ||  debit   || balance  "
        " #{today} ||   6.57   ||   0.00   ||  16.57   "
        " #{today} ||   0.00   ||  10.00   ||  10.00   "
        " #{today} ||  20.00   ||   0.00   ||  20.00   "
      PUBLISHED

      expect { Statement.print(sample_transactions) }.to output(table).to_stdout
    end
  end

  describe '#format' do
    it 'converts floats into strings' do
      expect(Statement.format(10.5)).to eq '10.50'
      expect(Statement.format(10.56)).to eq '10.56'
    end
  end
end
