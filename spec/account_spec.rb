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
      account.deposit(999)
      date = Time.now
      today = date.strftime('%d/%m/%Y')
      expect(account.log[0][:date]).to eq(today)
    end
  end
end
