class Date
  def self.todays_date
    time = Time.now
    time.strftime('%d/%m/%Y')
  end
end