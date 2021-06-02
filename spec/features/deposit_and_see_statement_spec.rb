require 'account'

# rubocop:disable RSpec/DescribeClass
xdescribe 'Feature: Deposit and see statement' do
  it 'make a deposit and see it within a statement' do
    ac = Account.new
    ac.deposit(1.50, '01/01/2000')
    output = "date || credit || debit || balance\n01/01/2000 || 1.00 || || 1.00"
    expect(ac.statement).to eq(output)
  end
end
# rubocop:enable RSpec/DescribeClass
