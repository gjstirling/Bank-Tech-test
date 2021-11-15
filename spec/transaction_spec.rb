describe Transaction do 

  describe '#process' do 

    it 'returns a deposit' do 
      expect(subject.process(10.0, :deposit)).to eq({credit: "10.00"})
      expect(subject.process(15.0, :deposit)).to eq({credit: "15.00"})
      expect(subject.process(15.51, :deposit)).to eq({credit: "15.51"})
    end
    
 

  end 

end 