defmodule MyRepo do
  use Ecto.Repo,
    otp_app: :my_app,
    adapter: EctoMnesia.Adapter
end
