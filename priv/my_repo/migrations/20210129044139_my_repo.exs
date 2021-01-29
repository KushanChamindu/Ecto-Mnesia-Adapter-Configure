defmodule MyRepo.Migrations.MyRepo do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:user, engine: :set) do
      add :email, :string
      add :encrypted_password, :string
      add :name, :string

      timestamps()
    end
    create unique_index(:user, [:email])
  end
end
