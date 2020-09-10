defmodule Virgil.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :name, :string
    field :email, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_email()
    |> validate_required([:name, :email])
    |> unique_constraint(:email)
  end

  @doc false
  defp validate_email(changeset) do
    email = get_field(changeset, :email)

    if Regex.match?(~r/@/, email) do
      changeset
    else
      add_error(changeset, :email, "needs to have an @ symbol")
    end
  end
end
