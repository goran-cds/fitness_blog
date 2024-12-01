defmodule FitnessBlogWeb.Components.App.TopBar.Components.DesktopView do
  use Phoenix.Component
  use FitnessBlogWeb, :html
  use Gettext, backend: FitnessBlogWeb.Gettext

  attr :page_selected, :atom
  attr :color_theme, :atom

  def render(assigns) do
    assigns =
      assign(assigns,
        class: [
          assigns.color_theme == :dark && "bg-app_neutral_900 text-app_main_100",
          assigns.color_theme == :light && ""
        ]
      )

    ~H"""
    <header class={[
      @class,
      "w-full sticky top-0 z-50 shadow-lg",
      "hidden md:flex md:justify-center md:px-6 md:py-4"
    ]}>
      <div class="flex items-center justify-between w-full max-w-screen-xl px-6">
        <!-- Logo Section -->
        <div class="flex items-center gap-4">
          <.link navigate={~p"/"}>
            <img src="/images/icons/logo-1.png" class="w-[165px]" alt="Logo" />
          </.link>
        </div>
        <!-- Navigation Links -->
        <nav class="flex items-center space-x-6 text-app_main_50 font-medium">
          <.link
            navigate={~p"/"}
            class="hover:underline hover:decoration-app_main_300 hover:underline-offset-8 text-app_secondary_50 transition duration-300"
          >
            Home
          </.link>
          <.link
            navigate={~p"/about"}
            class="hover:underline hover:decoration-app_main_300 hover:underline-offset-8 text-app_secondary_50 transition duration-300"
          >
            About Us
          </.link>
          <.link
            navigate={~p"/services"}
            class="hover:underline hover:decoration-app_main_300 hover:underline-offset-8 text-app_secondary_50 transition duration-300"
          >
            Services
          </.link>
          <.link
            navigate={~p"/blog"}
            class="hover:underline hover:decoration-app_main_300 hover:underline-offset-8 text-app_secondary_50 transition duration-300"
          >
            Blog
          </.link>
          <.link
            navigate={~p"/contact"}
            class="hover:underline hover:decoration-app_main_300 hover:underline-offset-8 text-app_secondary_50 transition duration-300"
          >
            Contact Us
          </.link>
        </nav>
        <div class="flex items-center gap-2 pl-4 pr-8 py-2 rounded-lg border border-app_neutral_500 group  hover:border-app_main_500 transition-all duration-300">
          <div class="w-8 h-8 rounded-lg p-2 flex items-center justify-center bg-app_main_500 group-hover:bg-app_main_600 transition-all duration-300">
            <Heroicons.plus class="w-5 text-app_white stroke-app_white stroke-2 transform group-hover:rotate-90 transition-transform duration-300" />
          </div>
          <.link class="font-semibold text-app_neutral_50">
            JOIN NOW
          </.link>
        </div>
      </div>
    </header>
    """
  end
end
