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
    def initialize(opts = {})
      validate_timestamps(opts[:timestamps], opts[:values].length)
      validate_colnames(opts[:colnames], opts[:values][0].length)

      @timestamps = opts[:timestamps]
      @values = opts[:values]
      @colnames = opts[:colnames]
      @meta = opts[:meta]
    end # def initialize

    def validate_timestamps(timestamps, nrow)
      if nrow != timestamps.length
        fail TimeSeries::Error.message(:val_timestamp_len)
      end

      if timestamps.uniq.length != timestamps.length
        fail TimeSeries::Error.message(:dup_timestamps)
      end
    end # def validate_timestamps

    def validate_colnames(colnames, ncol)
      if ncol != colnames.length
        fail TimeSeries::Error.message(:colnames_array_width)
      end
    end # def validate_colnames

    def length
      @timestamps.length
    end # def length

    public(:initialize, :length)
  end # class TimeArray
end # module TimeRanger
