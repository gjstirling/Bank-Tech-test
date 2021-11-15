describe Statement do 

  describe '#print' do 

    let(:transaction) { [{debit: 0, credit: 10.0, balance: 10.0}]}

    it 'prints statement header' do
      expect { Statement.print([]) }.to output("\"   date   ||  credit  ||  debit   || balance  \"\n").to_stdout 
    end
  

  
  end 


end