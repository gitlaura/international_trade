require 'runner'

describe "Runner" do 
	it "runs international calc" do 
		@runner = Runner.new
		expect(@runner.calculator).to receive(:get_conversion_rates)
		expect(@runner.calculator).to receive(:get_transactions)
		expect(@runner.calculator).to receive(:sort_transactions)
		expect(@runner.calculator).to receive(:convert_transactions)
		expect(@runner.calculator).to receive(:add_sorted_transactions)
		@runner.run_international_calculator("DM1210", "SAMPLE_TRANS.csv", "SAMPLE_RATES.xml")
	end
end