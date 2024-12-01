defmodule FitnessBlogWeb.Components.Web.Card do
  use Phoenix.Component

  attr :title, :string, required: true
  attr :width, :string, default: "w-full"

  slot :row do
    attr :separator, :boolean
  end

  slot :action

  def card(assigns) do
    ~H"""
    <div class={[
      @width,
      "bg-white p-6 rounded-lg flex flex-col gap-y-4 justify-between w-full shadow-md"
    ]}>
      <div class="flex flex-col gap-y-0.5 items-start w-full">
        <p class="font-bold text-hs_main_950 text-xl"><%= @title %></p>
      </div>
      <div :for={row <- @row}>
        <%= render_slot(row) %>
        <div :if={row[:separator]} class="w-full h-0.5 border border-gray-100 rounded-full mt-4">
        </div>
      </div>
      <div class="flex items-center gap-2">
        <%= for action <- @action do %>
          <%= render_slot(action) %>
        <% end %>
      </div>
    </div>
    """
  end
end
