defmodule TestVixBurrito.Repo do
  use Ecto.Repo,
    otp_app: :test_vix_burrito,
    adapter: Ecto.Adapters.Postgres
end
