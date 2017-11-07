# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :epithetr,
  ecto_repos: [Epithetr.Repo]

# Configures the endpoint
config :epithetr, EpithetrWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XwmrrO/Dn6bwYDOjKuT7p/wnYXl/0l90ScwIcI21LoAGIFNoefnvT2VZU6NQySat",
  render_errors: [view: EpithetrWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Epithetr.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :scrivener_html,
  routes_helper: Epithetr.Router.Helpers,
  view_style: :bootstrap_v4

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
