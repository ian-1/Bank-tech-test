require 'account'

describe Account do
  it 'can make a new account' do
    expect(Account.new).to be_instance_of(Account)
  end
end
