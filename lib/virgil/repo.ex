defmodule Virgil.Repo do
  use Ecto.Repo,
    otp_app: :virgil,
    adapter: Ecto.Adapters.Postgres
end
