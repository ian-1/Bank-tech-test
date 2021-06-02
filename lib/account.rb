require 'statement'

class Account
  attr_reader :log

  def initialize(statement = Statement.new)
    @log = []
    @balance = 0
    @statement = statement
  end

  def deposit(amount, date = todays_date)
    @balance += amount
    add_to_log('deposit', amount, date)
  end

  def withdraw(amount, date = todays_date)
    @balance -= amount
    add_to_log('withdrawal', amount, date)
  end

  def statement
    @statement.view(@log)
  end

  private

  def add_to_log(type, amount, date)
    transaction = {
      type: type,
      amount: amount,
      date: date,
      balance: @balance
    }
    @log << transaction
  end

  def todays_date
    time = Time.now
    time.strftime('%d/%m/%Y')
  end
end
