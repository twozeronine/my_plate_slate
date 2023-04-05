defmodule MyPlateSlate.Repo do
  use Ecto.Repo,
    otp_app: :my_plate_slate,
    adapter: Ecto.Adapters.Postgres
end
