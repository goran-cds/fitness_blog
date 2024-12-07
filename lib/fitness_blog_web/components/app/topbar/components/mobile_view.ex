defmodule FitnessBlogWeb.Components.App.TopBar.Components.MobileView do
  use Phoenix.Component
  use FitnessBlogWeb, :html
  use Gettext, backend: FitnessBlogWeb.Gettext

  attr :page_selected, :atom, values: [:home, :about, :services, :blog, :contact]
  attr :color_theme, :atom

  def render(assigns) do
    ~H"""
    <div class="items-center self-stretch flex w-full flex-col px-4 py-3.5 max-md:max-w-full md:hidden bg-app_neutral_900">
      <div class="justify-between items-center self-center flex w-full gap-5 p-0.5">
        <div class="flex gap-2 items-center">
          <div class="flex items-center gap-2">
            <.link navigate={~p"/"}>
              <img src="/images/icons/logo-1.png" class="w-[165px]" alt="Logo" />
            </.link>
          </div>
        </div>
        <Heroicons.bars_3 phx-click={show_modal("hamburger-menu")} class="w-5 text-app_white" />
      </div>
    </div>
    """
  end
end
