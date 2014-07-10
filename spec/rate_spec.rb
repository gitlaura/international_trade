require 'rate'

describe "Rate" do
	before(:each) do 
		@rate = Rate.new
		@rate.from_currency = "CAD"
		@rate.to_currency = "USD"
		@rate.rate = "1.0090".to_f
	end

	it "captures currencies and rate" do 
		expect(@rate.from_currency).to eq("CAD")
		expect(@rate.to_currency).to eq("USD")
		expect(@rate.rate).to eq(1.0090)
	end
end