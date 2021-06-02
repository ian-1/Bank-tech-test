class Statement
  def view(log)
    header = 'date || credit || debit || balance'
    entries = ''
    entry = log[0]
    entries = "\n#{entry[:date]} || #{two_dp(entry[:amount])} || || #{two_dp(entry[:amount])}" unless log == []
    header + entries
  end

  private

  def two_dp(amount)
    if whole_number?(amount)
      "#{amount}.00"
    elsif whole_number?(amount * 10)
      "#{amount}0"
    else
      amount
    end
  end

  def whole_number?(number)
    (number % 1).zero?
  end
end
