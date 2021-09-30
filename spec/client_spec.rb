# frozen_string_literal: true

describe Client do
  let(:present_date) { "#{Time.now.day}/#{Time.now.month}/#{Time.now.year}" }
  let(:client) { described_class.new('Johnny Cash') }
  let(:current_client) { described_class.new('Johnny Cash', 50.0) }



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
