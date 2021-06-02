require 'account'

describe Account do
  let(:account) { described_class.new }

  it 'can make a new account' do
    expect(described_class.new).to be_instance_of(described_class)
  end

  describe '#deposit' do
    it 'can accept a deposit and add a deposit type transaction to log' do
      account.deposit(9999)
      expect(account.log[0][:type]).to eq('deposit')
    end

    it 'can accept a deposit and add a deposit amount to log' do
      account.deposit(123)
      expect(account.log[0][:amount]).to eq(123)
    end

    it "can accept a deposit and add today's date to log" do
      account.deposit(1)
      date = Time.now
      today = date.strftime('%d/%m/%Y')
      expect(account.log[0][:date]).to eq(today)
    end

    it 'can accept a deposit and add a user provided date to log' do
      date = '30/12/1999'
      account.deposit(1, date)
      expect(account.log[0][:date]).to eq(date)
    end
  end

  describe '#statement' do
    it 'can return a blank statement' do
      blank_statement = 'date || credit || debit || balance'
      expect(account.statement).to eq(blank_statement)
    end
  end
end
