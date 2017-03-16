defmodule Examples.CounterTest do
  use ExUnit.Case
  doctest Examples.Counter

  test "apply sets the count" do
    now = DateTime.utc_now
    counter = Examples.Counter.increment_count_by(%Examples.Counter{count: 0}, %Examples.Counter.Events.CountIncremented{count: 123, timestamp: now})
    counter = Examples.Counter.increment_count_by(counter, %Examples.Counter.Events.CountIncremented{count: 1, timestamp: now})

    assert counter.count == 124
    assert counter.timestamp == now
  end

  test "increment_count_by sets the count" do
    now = DateTime.utc_now
    counter = Examples.Counter.apply(%Examples.Counter{count: 1}, %Examples.Counter.Commands.IncrementCount{count: 123, timestamp: now})

    assert counter.count == 124
    assert counter.timestamp == now
  end
end
