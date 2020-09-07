defmodule Virgil.Repo.Migrations.CreatePoems do
  use Ecto.Migration

  def change do
    create table(:poems) do
      add :title, :string, null: false
      add :author, :string, null: false
      add :text, :string, null: false

      timestamps()
    end

  end
end
