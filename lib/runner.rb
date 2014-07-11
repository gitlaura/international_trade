require_relative 'calculator.rb'

class Runner
	attr_reader :calculator

	def initialize
		@calculator = Calculator.new
	end

	def run_international_calculator(sku = "DM1210", transactions_file = "SAMPLE_TRANS.csv", rates_file = "SAMPLE_RATES.xml", final_currency = "USD")
		@calculator.get_conversion_rates(rates_file)
		@calculator.get_transactions(transactions_file)
		@calculator.sort_transactions(sku)
		@calculator.convert_transactions(final_currency)
		@calculator.add_sorted_transactions
	end
end