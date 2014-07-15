require 'calculator'
require 'ostruct'

describe "Calculator interface" do 
	let(:rates_file) {"SAMPLE_RATES.xml"}
	let(:trans_file) {"SAMPLE_TRANS.csv"}
	let(:trans_001) {OpenStruct.new(:store => "Yonkers", :sku => "DM1182", :original_amount => "19.68", :original_currency => "AUD")}
	let(:trans_002) {OpenStruct.new(:store => "Nashua", :sku => "DM1182", :original_amount => "58.58", :original_currency => "AUD")}
	let(:trans_003) {OpenStruct.new(:store => "Camden", :sku => "DM1182", :original_amount => "54.64", :original_currency => "USD")}
	let(:rate_one) {OpenStruct.new(:from_currency => "AUD", :to_currency => "CAD", :rate => 1.0079)}
	let(:rate_two) {OpenStruct.new(:from_currency => "CAD", :to_currency => "USD", :rate => 1.0090)}
	let(:rate_three) {OpenStruct.new(:from_currency => "USD", :to_currency => "CAD", :rate => 0.9911)}
	let(:sku) {"DM1182"}
	let(:to_currency) {"USD"}
	let(:transactions) {[trans_001, trans_002, trans_003]}
	let(:rates) {[rate_one, rate_two, rate_three]}

	it "gets a list of rates" do 
		rates = Calculator.get_conversion_rates(rates_file)
		expect(rates.size).to eq(3)
	end

	it "gets a list of transactions" do 
		transactions = Calculator.get_transactions(trans_file)
		expect(transactions.size).to eq(6)
	end

	it "sorts transactions by SKU" do
		sorted_transactions = Calculator.sort_transactions(sku, transactions)
		expect(sorted_transactions.size).to eq(3)
	end

	it "converts sorted transactions" do
		converted_amounts = Calculator.convert_transactions(to_currency, rates, transactions)
		expect(converted_amounts).to eq([20.01,59.57,54.64])
	end

	it "adds transactions in USD" do
		amounts = [15.00, 15.45, 19.20]
		expect(Calculator.add_sorted_transactions(amounts)).to eq(49.65)
	end
end