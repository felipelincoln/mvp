import Config

config :web, Web.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: nil],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/cache_manifest.json"
