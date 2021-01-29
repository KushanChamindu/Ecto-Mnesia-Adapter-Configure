import Config

config :ecto_mnesia,
  host: {:system, :atom, "MNESIA_HOST", Kernel.node()},
  storage_type: {:system, :atom, "MNESIA_STORAGE_TYPE", :disc_copies}

config :mnesia,
  dir: 'priv/data/mnesia'

config :my_app, MyRepo, adapter: EctoMnesia.Adapter

config :my_app, ecto_repos: [MyRepo]
