describe Statement do 

  TODAY = Time.now.strftime('%d-%m-%y')

  describe '#print' do 

    let(:transaction) { [{date: TODAY, debit: 0, credit: 10.0, balance: 10.0}]}

    it 'prints statement header' do
      expect { Statement.print([]) }.to output("\"   date   ||  credit  ||  debit   || balance  \"\n").to_stdout 
    end

    it 'prints a single transaction' do 
      table = <<~PUBLISHED
      "   date   ||  credit  ||  debit   || balance  "
      " #{TODAY} ||  10.00   ||   0.00   ||  10.00   "
    PUBLISHED

      expect { Statement.print(transaction) }.to output(table).to_stdout
 
    end 

  end 

  describe '#format' do
    it 'converts floats into strings' do 
      expect(Statement.format(10.5)).to eq "10.50"
      expect(Statement.format(10.56)).to eq "10.56"
    end 
  end 


end