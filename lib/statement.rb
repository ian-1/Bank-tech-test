class Statement
  def view(log)
    header = 'date || credit || debit || balance'
    entries = ''
    log.reverse.each do |entry|
      entries += if entry[:type] == 'deposit'
                   "\n#{entry[:date]} || #{round_to_two_dp(entry[:amount])} || || #{round_to_two_dp(entry[:balance])}"
                 else
                   "\n#{entry[:date]} || || #{round_to_two_dp(entry[:amount])} || #{round_to_two_dp(entry[:balance])}"
                 end
    end
    header + entries
  end

  private

  def round_to_two_dp(amount)
    if whole_number?(amount)
      "#{amount}.00"
    elsif whole_number?(amount * 10)
      "#{amount}0"
    else
      split_amount = amount.to_s.split('.')
      "#{split_amount[0]}.#{split_amount[1][0..1]}"
    end
  end

  def whole_number?(number)
    (number % 1).zero?
  end
end
