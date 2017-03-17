defmodule Counter.ServerSupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    IO.puts "Supervisor started"
    children = [
      worker(Counter.Server, [Counter.Server])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
