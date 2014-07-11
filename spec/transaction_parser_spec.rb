require 'transaction_parser'

describe "Transaction parser" do 
	it "parses a csv trans file" do 
		file = "SAMPLE_TRANS.csv"
		expect(TransactionParser.parse(file).size).to eq(6)
	end

	it "creates a transaction" do 
		file = "SAMPLE_TRANS.csv"
		result = TransactionParser.create_transaction("Yonkers,DM1210,70.00 USD")
		expect(result.store).to eq("Yonkers")
		expect(result.sku).to eq("DM1210")
		expect(result.original_currency).to eq("USD")
	end
end