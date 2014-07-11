require 'transaction_parser'
require 'rate'

describe "Transaction parser" do 
	it "parses a csv trans file" do 
		file = "SAMPLE_TRANS.csv"
		transaction_parser = TransactionParser.new
		expect(transaction_parser.parse(file).size).to eq(6)
	end

	it "creates a transaction" do 
		file = "SAMPLE_TRANS.csv"
		transaction_parser = TransactionParser.new
		result = transaction_parser.create_transaction("Yonkers,DM1210,70.00 USD")
		expect(result.store).to eq("Yonkers")
		expect(result.sku).to eq("DM1210")
		expect(result.original_currency).to eq("USD")
	end
end