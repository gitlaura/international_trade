require 'rates_parser'

describe "Rates parser" do 
	it "parses an xml currency rates file" do
		file = "SAMPLE_RATES.xml"
		rates = RatesParser.parse(file)
		expect(rates[0].from_currency).to eq("AUD")
		expect(rates[1].to_currency).to eq("USD")
		expect(rates[2].rate).to eq(0.9911)
	end
end