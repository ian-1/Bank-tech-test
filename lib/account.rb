require 'statement'

class Account
  attr_reader :log

  def initialize(statement = Statement.new)
    @log = []
    @statement = statement
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
    @statement.view(@log)
  end

  private

  def todays_date
    time = Time.now
    time.strftime('%d/%m/%Y')
  end
end
