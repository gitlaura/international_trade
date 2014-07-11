require 'ostruct'

class TransactionParser
	class << self

		def parse(csv_file)
			all_transactions = []
			file = File.open(csv_file).read
			file.each_line do |line|
				all_transactions << create_transaction(line)
			end
			all_transactions
		end

		def create_transaction(line)
			@store, @sku, @amount = line.chomp.split(",")
			@original_amount, @original_currency = @amount.split(" ")
			OpenStruct.new(:store => @store, :sku => @sku, :original_amount => @original_amount, :original_currency => @original_currency)
		end

	end
end