defmodule FitnessBlogWeb.DownloadController do
  use FitnessBlogWeb, :controller

  def download(conn, %{"name" => name}) do
    path = Path.join(["priv", "app_resources", "knowledge_base", "docx", "#{name}"])

    conn
    |> send_download({:file, path}, filename: "#{name}")
  end
end
