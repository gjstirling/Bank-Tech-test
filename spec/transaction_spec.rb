describe Transaction do 

  describe '#process' do 

    it 'returns a deposit' do 
      expect(subject.process(10.0, :deposit)).to eq({credit: "10.00"})
    end   

  end 

end 