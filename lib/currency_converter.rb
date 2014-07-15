class CurrencyConverter
	attr_reader :to_currency, :rates, :transactions, :amounts

	def initialize(to_currency, rates)
		@to_currency = to_currency
		@rates = rates
		@amounts = []
	end

	def convert(transactions)
		transactions.each do |trans|
			if conversion_unnecessary?(trans)
				@amounts << trans.original_amount.to_f
			else
				@amounts << convert_amount(trans.original_currency, trans.original_amount)
			end
		end
		@amounts
	end

	def conversion_unnecessary?(trans)
		return true if trans.original_currency == @to_currency
		return false
	end

	def convert_amount(original_currency, original_amount)
		rate = get_conversion_rate(original_currency)
		(rate * original_amount.to_f).round(2)
	end

	def get_conversion_rate(original_currency, final_conversion_rate = 1.00)
		if exact_match?(original_currency)
			new_rate = get_exact_matching_rate(original_currency)
			return final_conversion_rate * new_rate.rate
		else
			current_rate = rate_with_same_from_currency(original_currency)
			final_conversion_rate *=  current_rate.rate
			new_original_currency = current_rate.to_currency
			get_conversion_rate(new_original_currency, final_conversion_rate)
		end
	end

	def exact_match?(original_currency)
		rates_with_exact_matches(original_currency).size > 0
	end

	def get_exact_matching_rate(original_currency)
		rates_with_exact_matches(original_currency)[0]
	end

	def rates_with_exact_matches(original_currency)
		@rates.select {|rate| rate.from_currency == original_currency && rate.to_currency == @to_currency}
	end

	def rate_with_same_from_currency(original_currency)
		(@rates.select {|rate| rate.from_currency == original_currency})[0]
	end
end