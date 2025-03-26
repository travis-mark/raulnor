defmodule Raulnor.Repo do
  use Ecto.Repo,
    otp_app: :raulnor,
    adapter: Ecto.Adapters.SQLite3
end
