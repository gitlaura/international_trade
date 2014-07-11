class Transaction
	attr_reader :store, :sku, :original_currency, :original_amount
	
	def initialize(store, sku, amount)
  	@store = store
  	@sku = sku
    @original_amount, @original_currency = amount.split(" ") 
  end
end