# Ecto-Mnesia-Adapter-Configure

This is application configured with ecto_mnesia v0.9.1 (https://hexdocs.pm/ecto_mnesia/readme.html) dependancy.

# Installation

It is available in Hex, the package can be installed as:

1. Add ecto_mnesia to your list of dependencies in mix.exs:

      ````elixir
      def deps do [{:ecto_mnesia, “~> 0.9.0”}] end
      ````

2. Ensure ecto_mnesia is started before your application:

    ````elixir 
    def application do [applications: [:ecto_mnesia]] end
    ````


3. Use EctoMnesia.Adapter as your Ecto.Repo adapter:

    ````elixir
    config :my_app, MyRepo, adapter: EctoMnesia.Adapter
    ````

4. Optionally set custom Mnesia data dir (don’t forget to create it):

    ````elixir
    config :mnesia, :dir, ‘priv/data/mnesia’
    ````

The docs can be found at https://hexdocs.pm/ecto_mnesia.

After intall the application. We have to run followings respectively on terminal

````bash
  mix ecto   #thiis shows us to all task we can run with ecto
  mix ecto.drop
  mix ecto.create
  mix ecto.migrations
  mix ecto.migrate
````

After run this commands it will generate your mnesia badat base.
Then make sure your repo is runing on your supervision tree before run repo functions.

## Feel free to contact me if you have any issue with this codes. (kushanchamindu.17@cse.mrt.ac.lk)