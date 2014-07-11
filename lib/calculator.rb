require_relative 'rates_parser.rb'
require_relative 'transaction_parser.rb'
require_relative 'sort_by_sku.rb'
require_relative 'currency_converter.rb'

class Calculator
	class << self
		def get_conversion_rates(rate_file)
			RatesParser.parse(rate_file)
		end

		def get_transactions(trans_file)
			TransactionParser.parse(trans_file)
		end

		def sort_transactions(sku, transactions)
			SortBySku.sort(sku, transactions)
		end

		def convert_transactions(to_currency, rates, sorted_transactions)
			CurrencyConverter.new(to_currency, rates).convert(sorted_transactions)
		end

		def add_sorted_transactions(amounts)
			amounts.reduce(:+).round(2)
		end
	end
end