describe Statement do 

  describe '#print' do 
    it 'prints statement header' do
      expect { Statement.print([]) }.to output("\"   date   ||  credit  ||  debit   || balance  \"\n").to_stdout 
    end 
  end 


end