require_relative 'rate.rb'

class RatesParser
	attr_reader :all_rates

	def initialize
		@all_rates = []
	end

	def parse(xml_file)
		file = File.open(xml_file).read

		file.each_line do |line|
			line.strip!
			create_new_rate if is_rate?(line)
			set_from_currency(line) if is_from_currency?(line) 
			set_to_currency(line) if is_to_currency?(line)
			set_rate(line) if is_conversion?(line)
			@all_rates << @new_rate if is_end_rate?(line)
		end
		
		@all_rates
	end

	private

	def is_rate?(line)
		line[1..5] == "rate>"
	end

	def is_from_currency?(line)
		line[1..4] == "from"
	end

	def is_to_currency?(line)
		line[1..2] == "to"
	end

	def is_conversion?(line)
		line[1..3] == "con"
	end

	def is_end_rate?(line)
		line[1..6] == "/rate>"
	end

	def create_new_rate
		@new_rate = Rate.new
	end

	def set_from_currency(line)
		@new_rate.from_currency = line[6..8]
	end

	def set_to_currency(line)
		@new_rate.to_currency = line[4..6]
	end

	def set_rate(line)
		@new_rate.rate = line[12..17].to_f
	end
end