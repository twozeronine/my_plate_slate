import Config

config :my_plate_slate, MyPlateSlate.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "my_plate_slate_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10,
  port: 25432

config :my_plate_slate, MyPlateSlateWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "je10bmEy3iLM6EEH9JAkjH90MAFHmHIw+xX6ZQNn+BCmlRzqEecczXRwlza9AeJg",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]}
  ]

config :my_plate_slate, MyPlateSlateWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/my_plate_slate_web/(live|views)/.*(ex)$",
      ~r"lib/my_plate_slate_web/templates/.*(eex)$"
    ]
  ]

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime
