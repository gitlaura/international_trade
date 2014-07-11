require_relative 'rates_parser.rb'
require_relative 'transaction_parser.rb'
require_relative 'sort_by_sku.rb'
require_relative 'currency_converter.rb'

class Calculator
	attr_reader :rates, :transactions, :sorted_transactions, :converted_amounts

	def get_conversion_rates(rate_file)
		rates_parser = RatesParser.new
		rates_parser.parse(rate_file)
	end

	def get_transactions(trans_file)
		transaction_parser = TransactionParser.new
		transaction_parser.parse(trans_file)
	end

	def sort_transactions(sku, transactions)
		sort_by_sku = SortBySku.new
		sort_by_sku.sort(sku, transactions)
	end

	def convert_transactions(to_currency, rates, sorted_transactions)
		CurrencyConverter.new.convert(to_currency, rates, sorted_transactions)
	end

	def add_sorted_transactions(amounts)
		amounts.reduce(:+)
	end
end