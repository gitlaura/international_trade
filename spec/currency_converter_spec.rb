require 'currency_converter'
require 'ostruct'

describe "Currency Converter" do 
	let(:to_currency) {"USD"}
	let(:rate_one) {OpenStruct.new(:from_currency => "AUD", :to_currency => "CAD", :rate => 1.0079)}
	let(:rate_two) {OpenStruct.new(:from_currency => "CAD", :to_currency => "USD", :rate => 1.0090)}
	let(:rate_three) {OpenStruct.new(:from_currency => "USD", :to_currency => "CAD", :rate => 0.9911)}
	let(:rates) {[rate_one, rate_two, rate_three]}
	let(:trans_one) {OpenStruct.new(:store => "Nashua", :sku => "DM1182", :original_amount => "58.58", :original_currency => "AUD")}
	let(:trans_two) {OpenStruct.new(:store => "Camden", :sku => "DM1182", :original_amount => "54.64", :original_currency => "USD")}
	let(:sorted_transactions) {[trans_one, trans_two]}
	let(:currency_converter) {CurrencyConverter.new(to_currency, rates)}

	it "converts transactions into converted amounts" do 
		amounts = currency_converter.convert(sorted_transactions)
		expect(amounts).to eq([59.57,54.64])
	end

	it "determines if a conversion is not needed" do 
		expect(currency_converter.conversion_unnecessary?(trans_one)).to eq(false)
		expect(currency_converter.conversion_unnecessary?(trans_two)).to eq(true)
	end

	it "converts amounts" do 
		expect(currency_converter).to receive(:get_conversion_rate) {1.0090}
		amount = currency_converter.convert_amount("AUD", 50.00)
		expect(amount).to eq(50.45)
	end

	it "checks for an exact match of currencies" do 
		expect(currency_converter.exact_match?("CAD")).to eq(true)
		expect(currency_converter.exact_match?("AUD")).to eq(false)
	end

	it "gets exact matching rate object" do
		rate = currency_converter.get_exact_matching_rate("CAD")
		expect(rate.rate).to eq(1.0090)
	end

	it "returns rates that match to and from currency" do
		rates = currency_converter.rates_with_exact_matches("CAD")
		expect(rates.size).to eq(1)
	end

	it "returns rates that just the from currency" do
		rates = currency_converter.rate_with_same_from_currency("AUD")
		expect(rates).to be_a(Object)
	end
end