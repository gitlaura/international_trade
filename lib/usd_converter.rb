require_relative 'rates_parser.rb'

module USDConverter
	def convert(original_amount, from_currency, to_currency)
		@from_currency = from_currency
		@to_currency = to_currency
		@final_conversion_rate = 1.0

		if @from_currency == @to_currency
			return original_amount.to_f
		else
			get_conversion_rate
			return (@final_conversion_rate * original_amount.to_f).round(2)
		end
	end

	def get_conversion_rate
		@rates = RatesParser.new.parse("SAMPLE_RATES.xml")

		if exact_match?
			return @final_conversion_rate *= @current_rate
		else 
			find_from_currency_matches
			@final_conversion_rate *= @current_rate
			get_conversion_rate
		end
	end

	def exact_match?
		matching_rate = @rates.select {|rate| rate.from_currency == @from_currency && rate.to_currency == @to_currency}
		begin
			@current_rate = matching_rate[0].rate
			return true
		rescue
			return false 
		end
	end

	def find_from_currency_matches
		matching_from_currency_rates = @rates.select {|rate| rate.from_currency == @from_currency}
		@current_rate = matching_from_currency_rates[0].rate
		@from_currency = matching_from_currency_rates[0].to_currency
	end
end