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
      class_double(Date, todays_date: 'today in date form').as_stubbed_const
      account.deposit(1)
      expect(account.log.first[:date]).to eq('today in date form')
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
      class_double(Date, todays_date: 'today in date form').as_stubbed_const
      account.withdraw(1)
      expect(account.log.first[:date]).to eq('today in date form')
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

    it 'can accept multiple withdrawals and add a running ballance to log' do
      account.withdraw(1)
      account.withdraw(1)
      account.withdraw(1)
      expect(account.log.last[:balance]).to eq(-3)
    end
  end

  describe '#statement' do
    let(:stub_statement) { instance_double(Statement) }
    let(:stub_account) { described_class.new(stub_statement) }

    it 'calls statement.view with empty log as attribute' do
      allow(stub_statement).to receive(:view).with([]).and_return('header only table')
      expect(stub_account.statement).to eq('header only table')
    end

    it 'calls statement.view with a deposit in log as attribute' do
      stub_account.deposit(123, '01/01/1990')
      log = [{ type: 'deposit', amount: 123, date: '01/01/1990', balance: 123 }]
      allow(stub_statement).to receive(:view).with(log).and_return('header + deposit entry table')
      expect(stub_account.statement).to eq('header + deposit entry table')
    end
  end
end
