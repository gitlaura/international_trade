require 'currency_converter'
require 'rate'
require 'transaction'

describe "Currency Converter" do 
	before(:each) do
		@currency_converter = CurrencyConverter.new
		@to_currency = "USD"
		@trans_two = Transaction.new("Nashua","DM1182","58.58 AUD")
		@trans_three = Transaction.new("Camden","DM1182","54.64 USD")
		@sorted_transactions = [@trans_two, @trans_three]
		rate_one = Rate.new("AUD","CAD",1.0079)
		rate_two = Rate.new("CAD","USD",1.0090)
		rate_three = Rate.new("USD","CAD",0.9911)
		@rates = [rate_one, rate_two, rate_three]
	end

	it "converts transactions into converted amounts" do 
		amounts = @currency_converter.convert(@to_currency, @rates, @sorted_transactions)
		expect(amounts).to eq([59.57,54.64])
	end

	it "determines if a conversion is not needed" do 
		expect(@currency_converter.conversion_unnecessary?(@trans_two, "USD")).to eq(false)
		expect(@currency_converter.conversion_unnecessary?(@trans_three, "USD")).to eq(true)
	end

	it "converts amounts" do 
		expect(@currency_converter).to receive(:get_conversion_rate) {1.0090}
		amount = @currency_converter.convert_amount("AUD", 50.00)
		expect(amount).to eq(50.45)
	end

	it "gets conversion rate for any currency to final currency" do 
		expect(@currency_converter).to receive(:exact_match?) {true}
		expect(@currency_converter).to receive(:calculate_final_rate) {1.0090}
		final_rate = @currency_converter.get_conversion_rate("AUD", 1.00, @to_currency, @rates)
		expect(final_rate).to eq(1.0090)
	end

	it "checks for an exact match of currencies" do 
		expect(@currency_converter.exact_match?("CAD", @to_currency, @rates)).to eq(true)
		expect(@currency_converter.exact_match?("AUD", @to_currency, @rates)).to eq(false)
	end

	it "calculates final rate" do
		rate = @currency_converter.calculate_final_rate("CAD", @to_currency, @rates)
		expect(rate).to eq(1.0090)
	end

	it "checks for rates with the same from_currencies" do
		expect(@currency_converter.from_currency_matches?("AUD", @to_currency, @rates)).to eq(true)
	end

	it "calculates rate from the same from_currencies" do
		rate = @currency_converter.calculate_rate("AUD", @rates)
		expect(rate).to eq(1.0079)
	end

	it "updates from_currency for next conversion" do
		rate = @currency_converter.update_original_currency("AUD", @rates)
		expect(rate).to eq("CAD")
	end
end