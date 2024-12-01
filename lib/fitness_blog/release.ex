defmodule FitnessBlog.Release do
  @moduledoc """
  Used for executing DB release tasks when run in production without Mix
  installed.
  """
  @app :fitness_blog
  require Logger

  def insert_demo_data do
    with _ <- Application.ensure_all_started(@app),
         {:ok, _} <- Burohelp.Fixtures.Bootstrap.initialise() do
      Logger.info("Demo data inserted succesfully")
      {:ok, "Demo data inserted succesfully"}
    else
      error ->
        Logger.error("Demo data insertion failed to run with error #{inspect(error)}")
        {:error, error}
    end
  end

  def migrate do
    load_app()

    for repo <- repos() do
      {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :up, all: true))
    end
  end

  def rollback(repo, version) do
    load_app()
    {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :down, to: version))
  end

  defp repos do
    Application.fetch_env!(@app, :ecto_repos)
  end

  defp load_app do
    Application.load(@app)
  end
end
