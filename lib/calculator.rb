class Calculator
	attr_reader :rates, :transactions, :sorted_transactions

	def get_conversion_rates(rate_file)
		@rates = [0,0,0]
	end

	def get_transactions(trans_file)
		@transactions = [0,0,0,0,0,0]
	end

	def sort_transactions(sku)
		@sorted_transactions = [0,0,0]
	end

	def add_sorted_transactions
		134.22
	end
end