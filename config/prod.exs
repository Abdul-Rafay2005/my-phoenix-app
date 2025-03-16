import Config

# Configures the database for production
config :hello_world, HelloWorld.Repo,
  url: System.get_env("DATABASE_URL"),
  pool_size: 15

# Configures the web endpoint for production
config :hello_world, HelloWorldWeb.Endpoint,
  http: [
    port: System.get_env("PORT") || 4000
  ],
  url: [host: "your-app-name.railway.app", port: 80],  # Update with your actual Railway app URL
  cache_static_manifest: "priv/static/cache_manifest.json"

# Configures Swoosh API Client
config :swoosh, api_client: Swoosh.ApiClient.Finch, finch_name: HelloWorld.Finch

# Disable Swoosh Local Memory Storage
config :swoosh, local: false

# Do not print debug messages in production
config :logger, level: :info

# Runtime production configuration, including reading
# of environment variables, is done on config/runtime.exs.
