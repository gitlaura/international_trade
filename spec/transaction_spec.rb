require 'transaction'

describe "Transaction" do
	before(:each) do 
		
	end 
	it "creates a store, SKU, amount, and currency" do
		@transaction = Transaction.new
		@transaction.store = "Yonkers"
		@transaction.sku = "DM1210"
		@transaction.amount("70.00 USD")
		expect(@transaction.store).to eq("Yonkers")
		expect(@transaction.sku).to eq("DM1210")
		expect(@transaction.original_amount).to eq("70.00")
		expect(@transaction.original_currency).to eq("USD")
		expect(@transaction.converted_amount).to eq(70.00)
	end

	it "stores international currecncy as USD" do 
		@transaction = Transaction.new
		@transaction.store = "Yonkers"
		@transaction.sku = "DM1210"
		@transaction.amount("70.00 AUD")
		expect(@transaction.original_amount).to eq("70.00")
		expect(@transaction.original_currency).to eq("AUD")
		expect(@transaction.converted_amount).to eq(71.19)
	end
end