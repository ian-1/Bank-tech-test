class Account
  attr_reader :log

  def initialize
    @log = []
  end

  def deposit(amount, date = todays_date)
    transaction = {
      type: 'deposit',
      amount: amount,
      date: date
    }
    @log << transaction
  end

  def statement
    'date || credit || debit || balance'
  end

  private

  def todays_date
    time = Time.now
    time.strftime('%d/%m/%Y')
  end
end
