defmodule FitnessBlogWeb.Live.Services.Index do
  use FitnessBlogWeb, :live_view

  import FitnessBlogWeb.Components.Web.Layout.PageLayout

  def mount(_, _, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <.page_layout></.page_layout>
    """
  end
end
