require 'calculator'
require 'transaction'
require 'rate'

describe "Calculator interface" do 
	before(:each) do 
		@calculator = Calculator.new
		@rates_file = "SAMPLE_RATES.xml"
		@trans_file = "SAMPLE_TRANS.csv"
		trans_001 = Transaction.new("Yonkers","DM1182","19.68 AUD")
		trans_002 = Transaction.new("Nashua","DM1182","58.58 AUD")
		trans_003 = Transaction.new("Camden","DM1182","54.64 USD")
		@transactions = [trans_001, trans_002, trans_003]
		rate_one = Rate.new("AUD","CAD",1.0079)
		rate_two = Rate.new("CAD","USD",1.0090)
		rate_three = Rate.new("USD","CAD",0.9911)
		@rates = [rate_one, rate_two, rate_three]
		@sku = "DM1182"
		@to_currency = "USD"
	end

	it "gets a list of rates" do 
		rates = @calculator.get_conversion_rates(@rates_file)
		expect(rates.size).to eq(3)
	end

	it "gets a list of transactions" do 
		transactions = @calculator.get_transactions(@trans_file)
		expect(transactions.size).to eq(6)
	end

	it "sorts transactions by SKU" do
		sorted_transactions = @calculator.sort_transactions(@sku, @transactions)
		expect(sorted_transactions.size).to eq(3)
	end

	it "converts sorted transactions" do
		trans_001 = Transaction.new("Yonkers","DM1182","19.68 AUD")
		trans_002 = Transaction.new("Nashua","DM1182","58.58 AUD")
		trans_003 = Transaction.new("Camden","DM1182","54.64 USD")
		sorted_transactions = [trans_001, trans_002, trans_003]
		converted_amounts = @calculator.convert_transactions(@to_currency, @rates, sorted_transactions)
		expect(converted_amounts).to eq([20.01,59.57,54.64])
	end

	it "adds transactions in USD" do
		amounts = [15.00, 15.45, 19.20]
		expect(@calculator.add_sorted_transactions(amounts)).to eq(49.65)
	end
end