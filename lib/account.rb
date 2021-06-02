class Account
  attr_reader :log

  def initialize
    @log = []
  end

  def deposit(amount)
    @log << { type: 'deposit' }
  end
end
