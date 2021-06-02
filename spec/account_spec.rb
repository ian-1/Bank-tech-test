require 'account'

describe Account do
  it 'can make a new account' do
    expect(Account.new).to be_instance_of(Account)
  end

  describe '#deposit' do
    it 'can accept a deposit and add a deposit type transaction to log' do
      subject.deposit(9999)
      expect(subject.log[0][:type]).to eq('deposit')
    end
  end
end
