require_relative 'calculator.rb'

class Runner
	def run_international_calculator(sku, transactions_file, rates_file, final_currency)
		rates = Calculator.get_conversion_rates(rates_file)
		transactions = Calculator.get_transactions(transactions_file)
		sorted_transactions = Calculator.sort_transactions(sku, transactions)
		converted_totals = Calculator.convert_transactions(final_currency,rates,sorted_transactions)
		Calculator.add_sorted_transactions(converted_totals)
	end
end