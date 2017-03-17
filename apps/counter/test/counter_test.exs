defmodule CounterTest do
  use ExUnit.Case
  doctest Counter

  test "apply sets the count" do
    now = DateTime.utc_now
    counter = Counter.increment_count_by(%Counter{count: 0}, %Counter.Events.CountIncremented{count: 123, timestamp: now})
    counter = Counter.increment_count_by(counter, %Counter.Events.CountIncremented{count: 1, timestamp: now})

    assert counter.count == 124
    assert counter.timestamp == now
  end

  test "increment_count_by sets the count" do
    now = DateTime.utc_now
    counter = Counter.apply(%Counter{count: 1}, %Counter.Commands.IncrementCount{count: 123, timestamp: now})

    assert counter.count == 124
    assert counter.timestamp == now
  end
end
