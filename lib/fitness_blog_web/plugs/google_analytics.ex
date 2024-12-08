defmodule FitnessBlogWeb.GoogleAnalytics do
  import Plug.Conn

  def init(opts) do
    case Mix.env() do
      :prod ->
        ga_id = System.get_env("GA_ID") || "default_value"
        Keyword.put(opts, :ga_id, ga_id)

      _ ->
        opts
    end
  end

  def call(conn, ga_id: ga_id), do: put_session(conn, :ga_id, ga_id)
  def call(conn, _opts), do: conn
end
