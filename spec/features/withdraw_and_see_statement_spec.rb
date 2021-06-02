require 'account'

# rubocop:disable RSpec/DescribeClass
describe 'Feature: Deposit and see statement' do
  let(:ac) { Account.new }

  xit 'make a withdrawral and see it within a statement' do
    ac.withdraw(34, '01/01/2010')
    output = "date || credit || debit || balance\n01/01/2010 || || 34.00 || -34.00"
    expect(ac.statement).to eq(output)
  end
end
# rubocop:enable RSpec/DescribeClass
