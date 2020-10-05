# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :product,
  ecto_repos: [Product.Repo]

# Configures the endpoint
config :product, ProductWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zgFThiE3OE9vWj3WOTQdN3U4jdf5qSdVjKBTY6xWzvr/65J3XfrqxLNJYH4Jbwg4",
  render_errors: [view: ProductWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Product.PubSub,
  live_view: [signing_salt: "i/LDxFPN"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
