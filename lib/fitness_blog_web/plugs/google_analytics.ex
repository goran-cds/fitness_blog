defmodule FitnessBlogWeb.GoogleAnalytics do
  import Plug.Conn

  def init(opts) do
    case Mix.env() do
      :prod ->
        Keyword.put(opts, :ga_id, "G-C2L965D8HD")

      _ ->
        opts
    end
  end

  def call(conn, ga_id: ga_id), do: put_session(conn, :ga_id, ga_id)
  def call(conn, _opts), do: conn
end
