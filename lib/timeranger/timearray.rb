require 'timeranger/error'

module TimeRanger
  # A TimeArray is a representation of a time series with a fixed
  # interval.
  class TimeArray

    # Timestamps is an Array of values of child type Time.
    #
    # @return [Array]
    attr_accessor :timestamps

    # Values is a multi-dimensional array that holds data from 
    # the time series.
    #
    # @return [Array]
    attr_accessor :values

    # Colnames is an array of Strings that contains the names of 
    # the columns for each column in the values field.
    #
    # @return [Array]
    attr_accessor :colnames

    # Meta defaults to hold nothing. For those who wish to use
    # this field, meta can hold common types such as String or
    # more elaborate user-defined types. 
    #
    # @return [Array]
    attr_accessor :meta

    private

    # Creates a new instance of TimeArray.
    #
    # @param timestamps [Array]
    # @param values [Array]
    #
    # @return [TimeArray]
    def initialize(timestamps, values, colnames, meta)
      nrow = values.length
      ncol = values[0].length

      raise TimeSeries::Error.message(:val_timestamp_len) if nrow != timestamps.length
      raise TimeSeries::Error.message(:colnames_array_width) if ncol != colnames.length
      raise TimeSeries::Error.message(:dup_timestamps) if timestamps.uniq.length != timestamps.length

      @timestamps = timestamps
      @values = values
      @colnames = colnames
      @meta = meta
    end # def initialize

    def length
      return @timestamps.length
    end # def length

    public(:initialize, :length)

  end # class TimeArray
end # module TimeRanger
