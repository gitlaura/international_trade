require 'ostruct'

class RatesParser
	attr_reader :all_rates

	class << self

		def parse(xml_file)
			file = File.open(xml_file)
			all_rates = []

			file.each_line do |line|
				line.strip!
				@from_currency = get_from_currency(line) if is_from_currency?(line) 
				@to_currency = get_to_currency(line) if is_to_currency?(line)
				@rate = get_rate(line) if is_conversion?(line)
				if is_end_rate?(line)
					new_rate = OpenStruct.new(:from_currency => @from_currency, :to_currency => @to_currency, :rate => @rate)
					all_rates << new_rate 
				end
			end
			all_rates
		end

		private

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

		def get_from_currency(line)
			line[6..8]
		end

		def get_to_currency(line)
			line[4..6]
		end

		def get_rate(line)
			line[12..17].to_f
		end
	end
end