require 'account'

# rubocop:disable RSpec/DescribeClass
describe 'Tech Test Example' do
  let(:ac) { Account.new }

  it 'make multiple deposits and withdrawals and see them within a statement' do
    ac.deposit(1000, '10/01/2012')
    ac.deposit(2000, '13/01/2012')
    ac.withdraw(500, '14/01/2012')
    header = 'date || credit || debit || balance'
    line_one = "\n14/01/2012 || || 500.00 || 2500.00"
    line_two = "\n13/01/2012 || 2000.00 || || 3000.00"
    line_three = "\n10/01/2012 || 1000.00 || || 1000.00"
    output = header + line_one + line_two + line_three
    expect(ac.statement).to eq(output)
  end
end
# rubocop:enable RSpec/DescribeClass
