require 'account'

# rubocop:disable RSpec/DescribeClass
describe 'Feature: Deposit and see statement' do
  let(:ac) { Account.new }

  it 'make a deposit and see it within a statement' do
    ac.deposit(1.50, '01/01/2000')
    output = "date || credit || debit || balance\n01/01/2000 || 1.50 || || 1.50"
    expect(ac.statement).to eq(output)
  end

  it 'make multiple deposits and see them within a statement' do
    ac.deposit(9, '10/06/2020')
    ac.deposit(9.99, '11/06/2020')
    ac.deposit(99.1, '11/06/2020')
    header = 'date || credit || debit || balance'
    line_one = "\n11/06/2020 || 99.10 || || 118.09"
    line_two = "\n11/06/2020 || 9.99 || || 18.99"
    line_three = "\n10/06/2020 || 9.00 || || 9.00"
    output = header + line_one + line_two + line_three
    expect(ac.statement).to eq(output)
  end
end
# rubocop:enable RSpec/DescribeClass
