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
  def hello do
    IO.inspect Storage.check_mnesia_dir()
    Table.attributes(:user)
    all_user()
    user = %{name: "chamindu", encrypted_password: "123456", email: "abc@bac.com"}
    DB_user.create_user(user)
    all_user()
  end
  def all_user do
    DB_user.list_user()
  end
end
