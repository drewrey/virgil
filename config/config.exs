# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :virgil,
  ecto_repos: [Virgil.Repo]

# Configures the endpoint
config :virgil, VirgilWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FKbk5MeWUcHQTTC3FbF8dDhLnm87UHl9M3YT8eHQDk5A8CXxjB60h+XxiPVslXgw",
  render_errors: [view: VirgilWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Virgil.PubSub,
  live_view: [signing_salt: "6wCxscVX"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
