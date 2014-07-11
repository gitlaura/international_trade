require_relative 'calculator.rb'

class Runner
	attr_reader :calculator

	def initialize
		@calculator = Calculator.new
	end

	def run_international_calculator(sku = "DM1210", transactions_file = "SAMPLE_TRANS.csv", rates_file = "SAMPLE_RATES.xml", final_currency = "USD")
		rates = @calculator.get_conversion_rates(rates_file)
		transactions = @calculator.get_transactions(transactions_file)
		sorted_transactions = @calculator.sort_transactions(sku, transactions)
		converted_totals = @calculator.convert_transactions(final_currency,rates,sorted_transactions)
		@calculator.add_sorted_transactions(converted_totals)
	end
end