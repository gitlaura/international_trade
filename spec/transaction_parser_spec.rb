require 'transaction_parser'

describe "Transaction parser" do 
	xit "parses a csv trans file" do 
		file = "SAMPLE_TRANS.csv"
		transaction_parser = TransactionParser.new
		transaction_parser.parse(file)
		expect(transaction_parser.all_transactions.size).to eq(10)
	end

	xit "creates a transaction" do 
		file = "SAMPLE_TRANS.csv"
		transaction_parser = TransactionParser.new
		expect(transaction_parser.current_transaction).to receive(:amount)
		transaction_parser.create_transaction("Yonkers,DM1210,70.00 USD")
		expect(transaction_parser.current_transaction.store).to eq("Yonkers")
		expect(transaction_parser.current_transaction.sku).to eq("DM1210")
		
	end
end