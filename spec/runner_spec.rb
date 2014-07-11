require 'runner'

describe "Runner" do 
	it "runs international calc" do 
		@runner = Runner.new
		expect(Calculator).to receive(:get_conversion_rates)
		expect(Calculator).to receive(:get_transactions)
		expect(Calculator).to receive(:sort_transactions)
		expect(Calculator).to receive(:convert_transactions)
		expect(Calculator).to receive(:add_sorted_transactions)
		@runner.run_international_calculator("DM1210", "SAMPLE_TRANS.csv", "SAMPLE_RATES.xml", "USD")
	end
end