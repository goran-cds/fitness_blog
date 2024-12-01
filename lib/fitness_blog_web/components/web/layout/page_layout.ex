defmodule FitnessBlogWeb.Components.Web.Layout.PageLayout do
  use Phoenix.Component

  alias FitnessBlogWeb.Components.App.TopBar
  import FitnessBlogWeb.App.Footer

  attr :topbar_opts, :list, default: []
  attr :color_theme, :atom, values: [:light, :dark], default: :dark
  slot :inner_block, required: true

  def page_layout(assigns) do
    ~H"""
    <div class="min-h-screen h-full flex flex-col justify-between max-sm:pb-4">
      <div class="flex flex-col items-center justify-center">
        <.live_component
          module={TopBar.Index}
          id="top_bar"
          page_selected={@topbar_opts[:page_selected]}
          color_theme={@color_theme}
        />
        <%= render_slot(@inner_block) %>
      </div>
      <.footer color_theme={@color_theme} />
    </div>
    """
  end
end
