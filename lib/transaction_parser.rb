require_relative 'transaction.rb'

class TransactionParser
	attr_reader :all_transactions, :current_transaction

	def parse(csv_file)
		@all_transactions = []
		file = File.open(csv_file).read
		file.each_line do |line|
			create_transaction(line)
			@all_transactions << @current_transaction
		end
	end

	def create_transaction(line)
		store, sku, amount = line.chomp.split(",")
		@current_transaction = Transaction.new
		@current_transaction.store = store
		@current_transaction.sku = sku
		@current_transaction.amount(amount)
	end
end