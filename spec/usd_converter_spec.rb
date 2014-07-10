require 'usd_converter'

class TestClass
end

describe "USD Converter" do 
	before(:each) do
		@test_class = TestClass.new
		@test_class.extend(USDConverter)
	end

	it "leaves USD money the same" do
		expect(@test_class.convert("70.00", "USD", "USD")).to eq(70.00)
	end

	it "converts CAD to USD" do 
		expect(@test_class.convert("42.00", "CAD", "USD")).to eq(42.38) 
	end

	it "converts AUD to USD" do 
		expect(@test_class.convert("42.00", "AUD", "USD")).to eq(42.71) 
	end
end