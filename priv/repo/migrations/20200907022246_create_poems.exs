defmodule Virgil.Repo.Migrations.CreatePoems do
  use Ecto.Migration

  def change do
    create table(:poems, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string, null: false
      add :author, :string, null: false
      add :text, :string, null: false

      timestamps()
    end

  end
end
