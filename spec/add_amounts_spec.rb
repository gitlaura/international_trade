require 'add_amounts'

describe "Add Amounts" do 
	before(:each) do 
		@add_amounts = AddAmounts.new
	end

	it "adds together numbers in an array" do 
		expect(@add_amounts.add([5.00,6.00])).to eq(11.00)
		expect(@add_amounts.add([5.50,6.25,3.32])).to eq(15.07) 
	end
end