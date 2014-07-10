require 'rates_parser'

describe "Rates parser" do 
	before(:each) do 
		@rates_parser = RatesParser.new
	end

	it "parses an xml currency rates file" do
		file = "SAMPLE_RATES.xml"
		expect(@rates_parser.parse(file)[0].from_currency).to eq("AUD")
		expect(@rates_parser.parse(file)[1].to_currency).to eq("USD")
		expect(@rates_parser.parse(file)[2].rate).to eq(0.9911)
	end
end