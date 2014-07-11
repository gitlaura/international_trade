class Rate
	attr_accessor :from_currency, :to_currency, :rate

	def initialize(from_currency = nil, to_currency = nil, rate = nil)
		@from_currency = from_currency
		@to_currency = to_currency
		@rate = rate
	end
end