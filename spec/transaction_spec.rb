require 'transaction'
require 'rate'

describe "Transaction" do
	
	it "creates a store, SKU, amount, and currency" do
		@transaction = Transaction.new("Yonkers","DM1210","70.00 USD")
		expect(@transaction.store).to eq("Yonkers")
		expect(@transaction.sku).to eq("DM1210")
		expect(@transaction.original_amount).to eq("70.00")
		expect(@transaction.original_currency).to eq("USD")
	end

	it "stores international currency as AUD" do 
		@transaction = Transaction.new("Yonkers","DM1210","70.00 AUD")
		expect(@transaction.original_amount).to eq("70.00")
		expect(@transaction.original_currency).to eq("AUD")
	end
end