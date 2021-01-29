defmodule MyApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  require Logger

  use Application

  def start(_type, _args) do
    # {:ok, _pid} = SMPPGenESME.start_link()

    children = [
      # Starts a worker by calling: SMPPBackend.Worker.start_link(arg)
      # {SMPPBackend.Worker, arg}
      # {Task.Supervisor, name: SMPPGenESME.TaskSupervisor},
      # {CircuitBreaker.Api.Switch, []},
      {MyApp,[]},
      MyRepo
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MyRepo]
    {:ok, pid} = Supervisor.start_link(children, opts)
    Logger.info("SmppBackend started...")
    IO.inspect("#######################################")
    {:ok, pid}
  end

  def stop(_state) do
    Supervisor.stop(MyRepo)
  end
end
