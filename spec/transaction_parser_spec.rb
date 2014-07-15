require 'transaction_parser'

describe "Transaction parser" do 
	let(:file) {"SAMPLE_TRANS.csv"}

	it "parses a csv trans file" do 
		expect(TransactionParser.parse(file).size).to eq(6)
	end

	it "creates a transaction" do
		result = TransactionParser.create_transaction("Yonkers,DM1210,70.00 USD")
		expect(result.store).to eq("Yonkers")
		expect(result.sku).to eq("DM1210")
		expect(result.original_currency).to eq("USD")
	end
end