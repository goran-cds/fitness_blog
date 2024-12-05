defmodule FitnessBlogWeb.Components.Web.Layout.PageLayout do
  use Phoenix.Component

  alias FitnessBlogWeb.Components.App.TopBar
  import FitnessBlogWeb.App.Footer
  alias FitnessBlogWeb.CoreComponents

  attr :topbar_opts, :list, default: []
  attr :color_theme, :atom, values: [:light, :dark], default: :dark
  slot :inner_block, required: true

  def page_layout(assigns) do
    ~H"""
    <div class="min-h-screen h-full flex flex-col justify-between max-sm:pb-4 relative">
      <!-- Top Bar -->
      <div class="flex flex-col items-center justify-center">
        <.live_component
          module={TopBar.Index}
          id="top_bar"
          page_selected={@topbar_opts[:page_selected]}
          color_theme={@color_theme}
        />
        <%= render_slot(@inner_block) %>
      </div>
      <!-- Footer -->
      <.footer color_theme={@color_theme} />
      <!-- Floating Help Button -->
      <button
        phx-click={CoreComponents.show_modal("help_modal")}
        class="fixed left-8 bottom-8 z-50 bg-app_main_500 text-white rounded-full p-2 shadow-lg hover:bg-app_main_600 transition-all duration-300"
        title="Need help?"
      >
        <Heroicons.question_mark_circle class="text-app_white w-8" />
      </button>
      <!-- Floating Scroll to Top Button -->
      <button
        onclick="window.scrollTo({ top: 0, behavior: 'smooth' })"
        class="fixed right-8 bottom-8 z-50 bg-app_main_500 text-white rounded-full w-12 h-12 flex flex-col items-center justify-center shadow-lg hover:bg-app_main_600 transition-all duration-300"
        title="Back to top"
      >
        <Heroicons.chevron_double_up class="text-app_white w-6 h-6" />
        <span class="text-app_white text-xs">Top</span>
      </button>

      <%!-- Help modal --%>
      <CoreComponents.modal id="help_modal" width="w-1/2">
        <CoreComponents.simple_form
          for={to_form(%{})}
          phx-submit={CoreComponents.hide_modal("help_modal")}
        >
          <CoreComponents.input name="email" value="" type="email" placeholder="Your email address*" />
          <CoreComponents.input
            name="issue"
            value=""
            type="textarea"
            placeholder="Describe your issue*"
          />
          <div class="w-full flex justify-center items-center">
            <CoreComponents.button>SUBMIT</CoreComponents.button>
          </div>
        </CoreComponents.simple_form>
      </CoreComponents.modal>
    </div>
    """
  end
end
