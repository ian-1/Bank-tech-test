require 'date'

describe Date do
  it "can return today's date" do
    expect(described_class.todays_date).to eq(Time.now.strftime('%d/%m/%Y'))
  end
end
