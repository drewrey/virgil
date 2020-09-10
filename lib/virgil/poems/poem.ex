defmodule Virgil.Poems.Poem do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "poems" do
    has_many :comments, Virgil.Feedback.Comment

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
