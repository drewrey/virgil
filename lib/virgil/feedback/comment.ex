defmodule Virgil.Feedback.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "comments" do
    belongs_to :poem, Virgil.Poems.Poem
    belongs_to :user, Virgil.Accounts.User

    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:body, :poem_id, :user_id])
    |> foreign_key_constraint(:poem_id, name: :comments_poem_id_fkey)
    |> foreign_key_constraint(:user_id, name: :comments_user_id_fkey)
    |> validate_required([:body])
  end
end
