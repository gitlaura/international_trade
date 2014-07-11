require_relative 'transaction.rb'

class TransactionParser
	def parse(csv_file)
		all_transactions = []
		file = File.open(csv_file).read
		file.each_line do |line|
			all_transactions << create_transaction(line)
		end
		all_transactions
	end

	def create_transaction(line)
		store, sku, amount = line.chomp.split(",")
		Transaction.new(store, sku, amount)
	end
end