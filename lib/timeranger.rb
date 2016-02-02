# Standard library dependencies.
require 'csv'

# Internal dependencies.
require 'timeranger/version'
require 'timeranger/timearray'

# TimeRanger provides native time series modeling and analysis in Ruby.
module TimeRanger
  def read_time_array(fname)
    CSV.foreach(fname) do |record|
      begin
        DateTime.parse(record[1])
      rescue ArgumentError
        # Skip to the next record if we cannot parse the date.
        next
      end
    end

    TimeArray(tstamps, vals, cnames, meta)
  end # def read_time_array

  def insert_nan
  end # def insert_nan
end # module TimeRanger
