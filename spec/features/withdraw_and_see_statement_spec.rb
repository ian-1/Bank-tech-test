require 'account'

# rubocop:disable RSpec/DescribeClass
describe 'Feature: Deposit and see statement' do
  let(:ac) { Account.new }

  it 'make a withdrawral and see it within a statement' do
    ac.withdraw(34, '01/01/2010')
    output = "date || credit || debit || balance\n01/01/2010 || || 34.00 || -34.00"
    expect(ac.statement).to eq(output)
  end

  it 'make multiple withdrawals and see them within a statement' do
    ac.withdraw(9, '10/06/2020')
    ac.withdraw(9.99, '11/06/2020')
    ac.withdraw(99.1, '11/06/2020')
    header = 'date || credit || debit || balance'
    line_one = "\n11/06/2020 || || 99.10 || -118.09"
    line_two = "\n11/06/2020 || || 9.99 || -18.99"
    line_three = "\n10/06/2020 || || 9.00 || -9.00"
    output = header + line_one + line_two + line_three
    expect(ac.statement).to eq(output)
  end
end
# rubocop:enable RSpec/DescribeClass
