class Statement
  def view(log)
    header = 'date || credit || debit || balance'
    entries = ''
    entry = log[0]
    entries = "\n#{entry[:date]} || #{entry[:amount]}.00 || || #{entry[:amount]}.00" unless log == []
    header + entries
  end
end
