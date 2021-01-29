defmodule MyApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  require Logger

  use Application

  def start(_type, _args) do

    children = [
      {MyApp, [ ]},
      %{
        id: MyRepo,
        start: {MyRepo, :start_link, []}
      }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MyApp.Supervisor]
    {:ok, pid} = Supervisor.start_link(children, opts)
    Logger.info("MyApp started...")
    IO.inspect("#######################################")
    {:ok, pid}
  end

  def stop(_state) do
    Supervisor.stop(MyRepo)
  end
end
