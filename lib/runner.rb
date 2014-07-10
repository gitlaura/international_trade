require_relative 'calculator.rb'

class Runner
	attr_reader :calculator

	def initialize
		@calcuator = Calculator.new
	end

	def run_international_calculator(sku, transactions_file, rates_file)
		@calculator.get_rates(rates_file)
		@calculator.get_transactions(transactions_file)
		@calculator.sort_transactions(sku)
		@calculator.add_sorted_transactions(sku)
	end
end