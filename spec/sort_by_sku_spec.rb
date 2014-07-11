require 'sort_by_sku'
require 'ostruct'

describe "Sort by SKU" do 
	it "returns an array of transactions for chosen sku" do
		trans_001 = OpenStruct.new(:store => "Yonkers", :sku => "DM1210", :original_amount => "19.68", :original_currency => "AUD")
		trans_002 = OpenStruct.new(:store => "Nashua", :sku => "DM1182", :original_amount => "58.58", :original_currency => "AUD")
		trans_003 = OpenStruct.new(:store => "Camden", :sku => "DM1182", :original_amount => "54.64", :original_currency => "USD")
		transactions = [trans_001, trans_002, trans_003]
		sku = "DM1182"

		expect(SortBySku.sort(sku, transactions)).to eq([trans_002, trans_003])
	end
end