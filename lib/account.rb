class Account
  attr_reader :log

  def initialize
    @log = []
  end

  def deposit(amount)
    transaction = {
      type: 'deposit',
      amount: amount
    }
    @log << transaction
  end
end
