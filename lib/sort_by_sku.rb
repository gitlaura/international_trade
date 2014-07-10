class SortBySku
	def sort(transactions, sku)
		output = []
		transactions.each do |trans|
			if trans.sku == sku
				output << trans
			end
		end
		output
	end
end