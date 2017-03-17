defmodule Counter.Application do
  use Application

  def start(_type, _args) do
    Counter.ServerSupervisor.start_link
  end
end
