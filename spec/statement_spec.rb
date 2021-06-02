require 'statement'

describe Statement do
  let(:statement) { described_class.new }

  describe '#view' do
    it 'can return a blank statement' do
      blank_statement = 'date || credit || debit || balance'
      expect(statement.view([])).to eq(blank_statement)
    end

    it 'can display a deposit' do
      log = [{ type: 'deposit', amount: 123, date: '01/01/2001' }]
      account_statement = "date || credit || debit || balance\n01/01/2001 || 123.00 || || 123.00"
      expect(statement.view(log)).to eq(account_statement)
    end

    it 'can display a deposit with pence/cents etc' do
      log = [{ type: 'deposit', amount: 123.45, date: '01/01/2001' }]
      account_statement = "date || credit || debit || balance\n01/01/2001 || 123.45 || || 123.45"
      expect(statement.view(log)).to eq(account_statement)
    end

    it 'can display a deposit with 1 decimal point of pence/cents etc' do
      log = [{ type: 'deposit', amount: 123.4, date: '01/01/2001' }]
      account_statement = "date || credit || debit || balance\n01/01/2001 || 123.40 || || 123.40"
      expect(statement.view(log)).to eq(account_statement)
    end
  end
end
