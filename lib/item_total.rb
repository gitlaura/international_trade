class ItemTotal
	def add_sales(item_sales)
		item_sales.reduce(:+)
	end
end