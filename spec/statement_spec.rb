require 'statement'

describe Statement do
  let(:statement) { described_class.new }

  describe '#view' do
    it 'can return a blank statement' do
      blank_statement = 'date || credit || debit || balance'
      expect(statement.view([])).to eq(blank_statement)
    end

    it 'can display a deposit with zero pence/cents etc' do
      log = [{ type: 'deposit', amount: 123, date: '01/01/2001', balance: 123 }]
      account_statement = "date || credit || debit || balance\n01/01/2001 || 123.00 || || 123.00"
      expect(statement.view(log)).to eq(account_statement)
    end

    it 'can display a deposit with pence/cents etc' do
      log = [{ type: 'deposit', amount: 123.45, date: '01/01/2001', balance: 123.45 }]
      account_statement = "date || credit || debit || balance\n01/01/2001 || 123.45 || || 123.45"
      expect(statement.view(log)).to eq(account_statement)
    end

    it 'can display a deposit with 1 decimal point of pence/cents etc' do
      log = [{ type: 'deposit', amount: 123.4, date: '01/01/2001', balance: 123.4 }]
      account_statement = "date || credit || debit || balance\n01/01/2001 || 123.40 || || 123.40"
      expect(statement.view(log)).to eq(account_statement)
    end

    it 'can display multiple deposits' do
      log = [
        { type: 'deposit', amount: 123, date: '01/01/2002', balance: 123 },
        { type: 'deposit', amount: 456, date: '01/02/2002', balance: 579 }
      ]
      header = 'date || credit || debit || balance'
      line_one = "\n01/02/2002 || 456.00 || || 579.00"
      line_two = "\n01/01/2002 || 123.00 || || 123.00"
      account_statement = header + line_one + line_two
      expect(statement.view(log)).to eq(account_statement)
    end

    it 'can display a withdrawral' do
      log = [{ type: 'withdrawral', amount: 123.1, date: '01/01/2001', balance: -123.1 }]
      account_statement = "date || credit || debit || balance\n01/01/2001 || || 123.10 || -123.10"
      expect(statement.view(log)).to eq(account_statement)
    end
  end
end
