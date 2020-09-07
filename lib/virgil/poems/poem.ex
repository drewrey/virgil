defmodule Virgil.Poems.Poem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "poems" do
    field :author, :string
    field :text, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(poem, attrs) do
    poem
    |> cast(attrs, [:title, :author, :text])
    |> validate_required([:title, :author, :text])
  end
end