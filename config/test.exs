import Config

config :my_plate_slate, MyPlateSlate.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "my_plate_slate_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10,
  port: 25432

config :my_plate_slate, MyPlateSlateWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "E2BZ3pfATk8ccrMrzTyMbZQfuT2AkX+buDJBLDTKj8j0e1+aakzWKm8g3ubnVXFT",
  server: false

config :my_plate_slate, MyPlateSlate.Mailer, adapter: Swoosh.Adapters.Test

config :logger, level: :warn

config :phoenix, :plug_init_mode, :runtime
