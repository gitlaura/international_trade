require_relative 'lib/runner.rb'

runner = Runner.new
puts runner.run_international_calculator("DM1182", "SAMPLE_TRANS.csv","SAMPLE_RATES.xml", "USD")