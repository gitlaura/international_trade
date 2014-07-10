require 'item_total'

describe "Item total" do 
	before(:each) do 
		@item_total = ItemTotal.new
	end

	it "adds together numbers in an array" do 
		expect(@item_total.add_sales([5.00,6.00])).to eq(11.00)
		expect(@item_total.add_sales([5.50,6.25,3.32])).to eq(15.07) 
	end
end