require 'calculator'

describe "Calculator interface" do 
	before(:each) do 
		@calculator = Calculator.new
	end

	it "gets a list of rates" do 
		file = "SAMPLE_RATES.xml"
		@calculator.get_conversion_rates(file)
		expect(@calculator.rates.size).to eq(3)
	end

	it "gets a list of transactions" do 
		file = "SAMPLE_TRANS.csv"
		@calculator.get_transactions(file)
		expect(@calculator.transactions.size).to eq(6)
	end

	it "sorts transactions by SKU" do
		sku = "DM1182"
		@calculator.sort_transactions(sku)
		expect(@calculator.sorted_transactions.size).to eq(3)
	end

	it "adds transactions in USD" do
		expect(@calculator.add_sorted_transactions).to eq(134.22)
	end
end