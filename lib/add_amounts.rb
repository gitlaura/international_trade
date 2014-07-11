class AddAmounts
	def add(amounts)
		amounts.reduce(:+)
	end
end