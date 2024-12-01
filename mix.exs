defmodule FitnessBlog.MixProject do
  use Mix.Project

  def project do
    [
      app: :fitness_blog,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {FitnessBlog.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.7.6"},
      {:phoenix_ecto, "~> 4.4"},
      # Ecto SQL adapter
      {:ecto_sql, "~> 3.11.0"},
      # Ecto SQL - adapter Postgres
      {:postgrex, ">= 0.0.0"},
      # Ecto SQL - adapter Postgres extras
      {:ecto_psql_extras, "~> 0.7"},
      {:phoenix_html, "~> 3.3"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.20.17"},
      {:floki, ">= 0.30.0", only: :test},
      {:phoenix_live_dashboard, "~> 0.8.0"},
      {:esbuild, "~> 0.7", runtime: Mix.env() == :dev},
      {:tailwind, "~> 0.2.0", runtime: Mix.env() == :dev},
      {:swoosh, "~> 1.3"},
      {:finch, "~> 0.13"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:gettext, "~> 0.20"},
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 2.5"},
      # PG Vector support
      {:pgvector, "~> 0.3.0"},
      # Mime types information
      {:mime, "~> 2.0"},
      # Background job execution system
      {:oban, "~> 2.18.0"},
      # Generates typespecs for Ecto schemas
      {:typed_ecto_schema, "~> 0.4.1", runtime: false},
      # Markdown parser
      {:mdex, "~> 0.2.0"},
      # Chunks markdown into pieces
      {:text_chunker, "~> 0.3.1"},
      # Abstraction over LLM API's
      {:langchain, "0.3.0-rc.0"},
      # Code style checker
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      # Hero Icons collection
      {:heroicons, "~> 0.5"},
      # Tesla -HTTP Client
      {:tesla, "~> 1.11"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup", "assets.setup", "assets.build"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup", "run -e FitnessBlog.Release.insert_demo_data"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"],
      "assets.setup": ["tailwind.install --if-missing", "esbuild.install --if-missing"],
      "assets.build": ["tailwind default", "esbuild default"],
      "assets.deploy": ["tailwind default --minify", "esbuild default --minify", "phx.digest"]
    ]
  end
end
