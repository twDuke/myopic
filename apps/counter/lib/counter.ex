  defmodule Examples.Counter do
    defstruct [
      :count,
      :timestamp
    ]

    alias Examples.Counter
    alias Examples.Counter.Events.{
        CountIncremented
    }

    def increment_count_by(counter, increment_count) do
      IO.puts "\nCount incremented by #{increment_count.count} at #{increment_count.timestamp.hour}:#{increment_count.timestamp.minute}:#{increment_count.timestamp.second}\n"
      %CountIncremented {
        count: counter.count + increment_count.count,
        timestamp: increment_count.timestamp
      }
    end

    def apply(counter, count_incremented) do
      %Counter {
        count: counter.count + count_incremented.count,
        timestamp: count_incremented.timestamp
      }
    end
  end
