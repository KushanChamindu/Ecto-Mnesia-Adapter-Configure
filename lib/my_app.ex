defmodule MyApp do
  @moduledoc """
  Documentation for `MyApp`.
  """
  alias EctoMnesia.Table
  alias EctoMnesia.Storage
  alias MyApp.User
  alias Mnesia_db_interface, as: DB_user
  @doc """
  Hello world.

  ## Examples

      iex> MyApp.hello()
      :world

  """
  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]},
      type: :worker,
      restart: :permanent,
      shutdown: 500
    }
  end

  def start_link(_opts) do
    GenServer.start_link(Holding,[],name: :Holder)
  end
  def hello do
    IO.inspect Storage.check_mnesia_dir()
    Table.attributes(:user)
    all_user()
    user = %{name: "bob", encrypted_password: "12", email: "abc@bob.com"}
    IO.inspect DB_user.create_user(user)
    # all_user()
  end
  def all_user do
    DB_user.list_user()
  end
end

defmodule Holding do
  use GenServer
  require Logger

  def init(_) do
    Logger.info("timer init")
    {:ok, :disconnected}
  end

  def handle_info(:tick, state) do
    IO.inspect("#{state} = handle info")
    {:noreply, state}
  end
end
