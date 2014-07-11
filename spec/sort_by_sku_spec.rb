require 'sort_by_sku'
require 'transaction'

describe "Sort by SKU" do 
	it "returns an array of transactions for chosen sku" do
		trans_001 = Transaction.new("Yonkers","DM1210","70.00 USD")
		trans_002 = Transaction.new("Nashua","DM1182","58.58 AUD")
		trans_003 = Transaction.new("Camden","DM1182","54.64 USD")
		transactions = [trans_001, trans_002, trans_003]
		sku = "DM1182"

		sort_by_sku = SortBySku.new
		expect(sort_by_sku.sort(sku, transactions)).to eq([trans_002, trans_003])
	end
end