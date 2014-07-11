class SortBySku
	def self.sort(sku, transactions)
		output = []
		transactions.each do |trans|
			if trans.sku == sku
				output << trans
			end
		end
		output
	end
end