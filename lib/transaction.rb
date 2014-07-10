require_relative 'usd_converter.rb'

class Transaction
	include USDConverter

	attr_accessor :store, :sku
  attr_reader :original_amount, :original_currency, :converted_amount
	
	def initialize
  	@store
  	@sku
  end

  def amount(amount)
  	@original_amount, @original_currency = amount.split(" ")
  	@converted_amount = convert(@original_amount, @original_currency, "USD")
  end
end