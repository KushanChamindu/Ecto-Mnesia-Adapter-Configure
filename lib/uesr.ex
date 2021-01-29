defmodule MyApp.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :email, :string
    field :name, :string
    field :encrypted_password, :string

    # # VIRTUAL FIELDS
    # field :password_virtual, :string, virtual: true
    # field :password_confirmation_virtual, :string, virtual: true
    timestamps()
  end


  def changeset(user, attrs) do
    # IO.inspect user
    user
    |> cast(attrs, [:email, :name, :encrypted_password])
    |> validate_required([:email, :name, :encrypted_password])
    |> validate_length(:encrypted_password, min: 4)
    |> unique_constraint(:email)
  end
end
