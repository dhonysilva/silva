defmodule Silva.Repo do
  use Ecto.Repo,
    otp_app: :silva,
    adapter: Ecto.Adapters.SQLite3
end
