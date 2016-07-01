# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :nip,
  ecto_repos: [Nip.Repo]

# Configures the endpoint
config :nip, Nip.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lHcJi9z3cVi9Ai+/G2s24HhWO7OkaY/1FPnNa1EpUPZpS6SuvgN25WCAff6aWSjM",
  render_errors: [view: Nip.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Nip.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
