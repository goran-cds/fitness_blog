defmodule FitnessBlogWeb.Components.App.TopBar.Index do
  use FitnessBlogWeb, :live_component

  alias FitnessBlogWeb.Components.App.TopBar

  def update(assigns, socket) do
    {:ok,
     socket |> assign(color_theme: assigns[:color_theme], page_selected: assigns[:page_selected])}
  end

  def render(assigns) do
    ~H"""
    <div class={[
      "w-full z-30 top-0 relative sticky"
    ]}>
      <TopBar.Components.DesktopView.render page_selected={@page_selected} color_theme={@color_theme} />
      <TopBar.Components.MobileView.render page_selected={@page_selected} color_theme={@color_theme} />
      <TopBar.Components.HamburgerMenu.render
        page_selected={@page_selected}
        color_theme={@color_theme}
      />
    </div>
    """
  end
end
