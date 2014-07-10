require 'sort_by_sku'
require 'transaction'

describe "Sort by SKU" do 
	it "returns an array of transactions for chosen sku" do
		trans_001 = Transaction.new
		trans_001.sku = "DM1210"
		trans_002 = Transaction.new
		trans_002.sku = "DM1200"
		trans_003 = Transaction.new
		trans_003.sku = "DM1210"

		transactions = [trans_001, trans_002, trans_003]
		sku = "DM1210"

		sort_by_sku = SortBySku.new
		expect(sort_by_sku.sort(transactions, sku)).to eq([trans_001, trans_003])
	end
end