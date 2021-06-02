require 'account'

describe Account do
  let(:account) { described_class.new }

  it 'can make a new account' do
    expect(described_class.new).to be_instance_of(described_class)
  end

  describe '#deposit' do
    it 'can accept a deposit and add a deposit type transaction to log' do
      account.deposit(9999)
      expect(account.log.first[:type]).to eq('deposit')
    end

    it 'can accept a deposit and add a deposit amount to log' do
      account.deposit(123)
      expect(account.log.first[:amount]).to eq(123)
    end

    it "can accept a deposit and add today's date to log" do
      account.deposit(1)
      date = Time.now
      today = date.strftime('%d/%m/%Y')
      expect(account.log.first[:date]).to eq(today)
    end

    it 'can accept a deposit and add a user provided date to log' do
      date = '30/12/1999'
      account.deposit(1, date)
      expect(account.log.first[:date]).to eq(date)
    end

    it 'can accept a deposit and add a ballance to log' do
      account.deposit(1.23)
      expect(account.log.first[:balance]).to eq(1.23)
    end

    it 'can accept multiple deposits and add a running ballance to log' do
      account.deposit(1)
      account.deposit(1)
      account.deposit(1)
      expect(account.log.last[:balance]).to eq(3)
    end
  end

  describe '#withdraw' do
    it 'can accept a withdrawal and add a withdrawral type transaction to log' do
      account.withdraw(9999)
      expect(account.log.first[:type]).to eq('withdrawal')
    end

    it 'can accept a withdrawal and add a withdrawal amount to log' do
      account.withdraw(123)
      expect(account.log.first[:amount]).to eq(123)
    end

    it "can accept a withdrawal and add today's date to log" do
      account.withdraw(1)
      date = Time.now
      today = date.strftime('%d/%m/%Y')
      expect(account.log.first[:date]).to eq(today)
    end

    it 'can accept a withdrawral and add a user provided date to log' do
      date = '30/12/1999'
      account.withdraw(1, date)
      expect(account.log.first[:date]).to eq(date)
    end

    it 'can accept a withdrawal and minus a ballance from log' do
      account.withdraw(987.6)
      expect(account.log.first[:balance]).to eq(-987.60)
    end
  end

  describe '#statement' do
    let(:stub_statement) { double(:stub_statement) }
    let(:stub_account) { described_class.new(stub_statement) }

    it 'calls statement.view with empty log as attribute' do
      allow(stub_statement).to receive(:view)
      stub_account.statement
      expect(stub_statement).to have_received(:view).with([])
    end

    it 'calls statement.view with a deposit in log as attribute' do
      stub_account.deposit(123, '01/01/1990')
      allow(stub_statement).to receive(:view)
      log = [{ type: 'deposit', amount: 123, date: '01/01/1990', balance: 123 }]
      stub_account.statement
      expect(stub_statement).to have_received(:view).with(log)
    end
  end
end
