# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :url_shorten,
  ecto_repos: [UrlShorten.Repo]

# Configures the endpoint
config :url_shorten, UrlShortenWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0Qwg7JnHZC4vYGV28fwdLgnvB2V14+KexvBG/ouCBP8RcBDchhQXJpXpECOvJ8Pn",
  render_errors: [view: UrlShortenWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: UrlShorten.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# ...
# Configure your database
config :url_shorten, UrlShorten.Repo,
  adapter: EctoMnesia.Adapter

config :ecto_mnesia,
  host: {:system, :atom, "MNESIA_HOST", Kernel.node()},
  storage_type: {:system, :atom, "MNESIA_STORAGE_TYPE", :disc_copies}

config :mnesia,
  dir: 'priv/data/mnesia'
# ...

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
