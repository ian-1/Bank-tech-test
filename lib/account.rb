class Account
  attr_reader :log

  def initialize
    @log = []
  end

  def deposit(amount)
    transaction = {
      type: 'deposit',
      amount: amount,
      date: todays_date
    }
    @log << transaction
  end

  private

  def todays_date
    time = Time.now
    time.strftime('%d/%m/%Y')
  end
end
