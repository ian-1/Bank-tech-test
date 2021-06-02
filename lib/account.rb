class Account
  attr_reader :log

  def initialize
    @log = []
  end

  def deposit(amount)
    transaction = {
      type: 'deposit',
      amount: amount,
      date:  Time.now.strftime("%d/%m/%Y")
    }
    @log << transaction
  end
end
