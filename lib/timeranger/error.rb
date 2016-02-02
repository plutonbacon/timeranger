module TimeRanger
  # An exception raised by TimeRanger code.
  class Error < StandardError
    MESSAGES = {
      dup_timestamps:    'Timestamps cannot contain duplicate values.',
      val_timestamp_len: 'Values must match the length of timestamps.',
      col_timestamp_len: ''
    }.freeze

    def self.message(key, *args)
      # rubocop:disable Style/AndOr, Style/SignalException,  Metrics/LineLength
      string = MESSAGES[key] or raise "[TimeRanger Bug] No error messages for #{key}"
      # rubocop:enable
      (args.empty? ? string : string % args).rstrip
    end # def self.message

    def initialize(message = nil)
      super(message)
    end # def initialize
  end # class Error
end # module TimeRanger
