defmodule Counter.Server do
  use GenServer

  alias Counter.Commands.{
      IncrementCount
  }
  # Client
  def start_link(name) do
    IO.puts "Server start requested"
    GenServer.start_link(__MODULE__, :ok, name: name)
  end

  def get_count(server) do
    GenServer.call(server, {:get_count})
  end

  def increment_count(server, count) do
    GenServer.cast(server, {:increment, count})
  end

  # Server
  def init(:ok) do
    IO.puts "Server init"
    counter = %Counter{count: 0, timestamp: DateTime.utc_now}
    {:ok, counter}
  end

  def handle_cast({:increment, count}, counter) do
    counter = Counter.increment_count_by(counter, %IncrementCount{count: count, timestamp: DateTime.utc_now})
    {:noreply, counter}
  end

  def handle_call({:get_count}, _from, counter) do
    {:reply, counter.count, counter}
  end

  def handle_info(msg, state) do
    IO.puts("#{msg}")
    {:noreply, state}
  end
end
