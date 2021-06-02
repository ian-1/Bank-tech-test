require 'statement'

describe Statement do
  let(:statement) { described_class.new }

  describe '#view' do
    it 'can return a blank statement' do
      blank_statement = 'date || credit || debit || balance'
      expect(statement.view([])).to eq(blank_statement)
    end
  end
end
