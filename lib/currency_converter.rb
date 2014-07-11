class CurrencyConverter
	attr_reader :to_currency, :rates, :transactions, :amounts

	def initialize(to_currency, rates)
		@to_currency = to_currency
		@rates = rates
		@amounts = []
		@final_conversion_rate = 1.00
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

	def get_conversion_rate(original_currency)
		if exact_match?(original_currency)
			new_rate = calculate_final_rate(original_currency)
			final_rate = @final_conversion_rate * new_rate
			@final_conversion_rate = 1.00
			return final_rate
		elsif from_currency_matches?(original_currency)
			new_rate = calculate_rate(original_currency)
			@final_conversion_rate *=  new_rate
			new_original_currency = update_original_currency(original_currency)
			get_conversion_rate(new_original_currency)
		end
	end

	def exact_match?(original_currency)
		!(@rates.select {|rate| rate.from_currency == original_currency && rate.to_currency == @to_currency}).empty?
	end

	def calculate_final_rate(original_currency)
		matching_rates = @rates.select {|rate| rate.from_currency == original_currency && rate.to_currency == @to_currency}
		matching_rates[0].rate
	end

	def from_currency_matches?(original_currency)
		!(@rates.select {|rate| rate.from_currency == original_currency}).empty?
	end

	def calculate_rate(original_currency, rates = @rates)
		matching_rates = @rates.select {|rate| rate.from_currency == original_currency}
		matching_rates[0].rate
	end

	def update_original_currency(original_currency)
		matching_rates = @rates.select {|rate| rate.from_currency == original_currency}
		matching_rates[0].to_currency
	end
end