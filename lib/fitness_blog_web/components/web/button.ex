defmodule FitnessBlogWeb.Components.Web.Button do
  use Phoenix.Component

  attr :disabled, :boolean, default: false

  attr :size, :atom,
    values: [:small, :medium, :large, :xlarge, :xxlarge],
    default: :small

  attr :width, :string, default: "w-full"

  attr :icon, :atom,
    values: [
      :copy,
      :envelope,
      :cloud_arrow_up,
      :cloud_arrow_down,
      :no_symbol,
      :chat_bubble_left_right,
      :minus,
      :plus,
      :check,
      :chat_bubble_oval_left,
      :x_mark,
      :printer,
      :arrow_left,
      :pencil_square,
      :arrow_top_right_on_square,
      :trash,
      :bars_3,
      :phone,
      :paper_airplane,
      :ellipsis_vertical,
      :chevron_down,
      :magnifying_glass,
      :document_chart_bar,
      :heart,
      :bookmark
    ],
    required: false

  attr :colour, :atom,
    values: [:main, :neutral],
    default: :main,
    doc: "The colour of the button"

  attr :rest, :global,
    include: ~w(disabled form name value navigate href method target),
    doc: "Any attribute that works for a <.link> or a <.button>"

  attr :text, :string, doc: "The button text"

  attr :type, :atom,
    values: [:app, :external],
    default: :app

  def button(%{text: _text} = assigns) when not is_nil(assigns.icon) do
    assigns =
      assign(assigns,
        icon_class: [
          assigns.size in [:small, :medium, :large, :xlarge] && "w-5 h-5",
          assigns.size == :xxlarge && "w-6 h-6",
          assigns.colour == :main &&
            "stroke-hs_white",
          assigns.colour == :neutral &&
            "stroke-hs_neutral_600"
        ],
        button_class: [
          "phx-submit-loading:opacity-75 flex items-center justify-center rounded-lg",
          assigns.size == :small && "px-3 py-2 h-9 space-x-1",
          assigns.size == :medium && "px-3.5 py-2.5 h-10 space-x-1",
          assigns.size == :large && "px-4 py-2.5 h-11 space-x-1.5",
          assigns.size == :xlarge && "px-4.5 py-3 h-12 space-x-1.5",
          assigns.size == :xxlarge && "px-5.5 py-4 h-[3.75rem] space-x-2.5",
          assigns.colour == :main &&
            "bg-hs_main_600 hover:bg-hs_main_500 border border-hs_main_600 phx-click-loading:text-hs_white",
          assigns.colour == :neutral &&
            "bg-hs_white hover:bg-hs_neutral_25 border border-hs_main_100 phx-click-loading:text-hs_neutral_600"
        ],
        text_class: [
          assigns.size in [:small, :medium] && "px-0.5 text-sm",
          assigns.size in [:large, :xlarge] && "px-0.5 text-md font-bold",
          assigns.size == :xxlarge && "px-0.5 text-lg font-bold",
          assigns.colour == :main &&
            "text-hs_white",
          assigns.colour == :neutral &&
            "stroke-hs_neutral_600"
        ]
      )

    ~H"""
    <.link :if={@type == :external} class={@width} {@rest}>
      <button class={["w-full" | @button_class]}>
        <Heroicons.document_duplicate :if={@icon == :copy} class={@icon_class} />
        <Heroicons.envelope :if={@icon == :envelope} class={@icon_class} />
        <Heroicons.cloud_arrow_up :if={@icon == :cloud_arrow_up} class={@icon_class} />
        <Heroicons.cloud_arrow_down :if={@icon == :cloud_arrow_down} class={@icon_class} />
        <Heroicons.no_symbol :if={@icon == :no_symbol} class={@icon_class} />
        <Heroicons.chat_bubble_left_right :if={@icon == :chat_bubble_left_right} class={@icon_class} />
        <Heroicons.minus :if={@icon == :minus} class={@icon_class} />
        <Heroicons.plus :if={@icon == :plus} class={@icon_class} />
        <Heroicons.check :if={@icon == :check} class={@icon_class} />
        <Heroicons.chat_bubble_oval_left :if={@icon == :chat_bubble_oval_left} class={@icon_class} />
        <Heroicons.x_mark :if={@icon == :x_mark} class={@icon_class} />
        <Heroicons.printer :if={@icon == :printer} class={@icon_class} />
        <Heroicons.pencil_square :if={@icon == :pencil_square} class={@icon_class} />
        <Heroicons.arrow_top_right_on_square
          :if={@icon == :arrow_top_right_on_square}
          class={@icon_class}
        />
        <Heroicons.trash :if={@icon == :trash} class={@icon_class} />
        <Heroicons.bars_3 :if={@icon == :bars_3} class={@icon_class} />
        <Heroicons.phone :if={@icon == :phone} class={@icon_class} />
        <Heroicons.paper_airplane :if={@icon == :paper_airplane} class={@icon_class} />
        <Heroicons.ellipsis_vertical :if={@icon == :ellipsis_vertical} class={@icon_class} />
        <Heroicons.chevron_down :if={@icon == :chevron_down} class={@icon_class} />
        <Heroicons.arrow_left :if={@icon == :arrow_left} class={@icon_class} />
        <Heroicons.document_chart_bar :if={@icon == :document_chart_bar} class={@icon_class} />
        <Heroicons.heart :if={@icon == :heart} class={@icon_class} />
        <Heroicons.bookmark :if={@icon == :bookmark} class={@icon_class} />

        <p class={@text_class}>
          <%= @text %>
        </p>
      </button>
    </.link>
    <button :if={@type == :app} class={[@width | @button_class]} {@rest}>
      <Heroicons.document_duplicate :if={@icon == :copy} class={@icon_class} />
      <Heroicons.envelope :if={@icon == :envelope} class={@icon_class} />
      <Heroicons.cloud_arrow_up :if={@icon == :cloud_arrow_up} class={@icon_class} />
      <Heroicons.cloud_arrow_down :if={@icon == :cloud_arrow_down} class={@icon_class} />
      <Heroicons.no_symbol :if={@icon == :no_symbol} class={@icon_class} />
      <Heroicons.chat_bubble_left_right :if={@icon == :chat_bubble_left_right} class={@icon_class} />
      <Heroicons.minus :if={@icon == :minus} class={@icon_class} />
      <Heroicons.plus :if={@icon == :plus} class={@icon_class} />
      <Heroicons.check :if={@icon == :check} class={@icon_class} />
      <Heroicons.chat_bubble_oval_left :if={@icon == :chat_bubble_oval_left} class={@icon_class} />
      <Heroicons.x_mark :if={@icon == :x_mark} class={@icon_class} />
      <Heroicons.printer :if={@icon == :printer} class={@icon_class} />
      <Heroicons.pencil_square :if={@icon == :pencil_square} class={@icon_class} />
      <Heroicons.arrow_top_right_on_square
        :if={@icon == :arrow_top_right_on_square}
        class={@icon_class}
      />
      <Heroicons.trash :if={@icon == :trash} class={@icon_class} />
      <Heroicons.bars_3 :if={@icon == :bars_3} class={@icon_class} />
      <Heroicons.phone :if={@icon == :phone} class={@icon_class} />
      <Heroicons.paper_airplane :if={@icon == :paper_airplane} class={@icon_class} />
      <Heroicons.ellipsis_vertical :if={@icon == :ellipsis_vertical} class={@icon_class} />
      <Heroicons.chevron_down :if={@icon == :chevron_down} class={@icon_class} />
      <Heroicons.magnifying_glass :if={@icon == :magnifying_glass} class={@icon_class} />
      <Heroicons.arrow_left :if={@icon == :arrow_left} class={@icon_class} />
      <Heroicons.document_chart_bar :if={@icon == :document_chart_bar} class={@icon_class} />
      <Heroicons.heart :if={@icon == :heart} class={@icon_class} />
      <Heroicons.bookmark :if={@icon == :bookmark} class={@icon_class} />
      <p class={@text_class}>
        <%= @text %>
      </p>
    </button>
    """
  end

  def button(%{text: _text} = assigns) do
    assigns =
      assign(assigns,
        button_class: [
          "phx-submit-loading:opacity-75 flex items-center justify-center rounded-lg",
          assigns.size == :small && "px-3 py-2 h-9 space-x-1",
          assigns.size == :medium && "px-3.5 py-2.5 h-10 space-x-1",
          assigns.size == :large && "px-4 py-2.5 h-11 space-x-1.5",
          assigns.size == :xlarge && "px-4.5 py-3 h-12 space-x-1.5",
          assigns.size == :xxlarge && "px-5.5 py-4 h-[3.75rem] space-x-2.5",
          assigns.colour == :main &&
            "bg-hs_main_600 hover:bg-hs_main_500 border border-hs_main_600 phx-click-loading:text-hs_white",
          assigns.colour == :neutral &&
            "bg-hs_neutral_50 hover:bg-hs_neutral_25 border border-hs_neutral_200 phx-click-loading:text-hs_neutral_600"
        ],
        text_class: [
          assigns.size in [:small, :medium] && "px-0.5 text-sm",
          assigns.size in [:large, :xlarge] && "px-0.5 text-md font-bold",
          assigns.size == :xxlarge && "px-0.5 text-lg font-bold",
          assigns.colour == :main &&
            "text-hs_white",
          assigns.colour == :neutral &&
            "stroke-hs_neutral_600"
        ]
      )

    ~H"""
    <.link :if={@type == :external} class={@width} {@rest}>
      <button class={["w-full" | @button_class]}>
        <p class={@text_class}>
          <%= @text %>
        </p>
      </button>
    </.link>
    <button :if={@type == :app} class={[@width | @button_class]} {@rest}>
      <p class={@text_class}>
        <%= @text %>
      </p>
    </button>
    """
  end

  def button(assigns) when not is_nil(assigns.icon) do
    assigns =
      assign(assigns,
        icon_class: [
          assigns.size in [:small, :medium, :large, :xlarge] && "w-5 h-5",
          assigns.size == :xxlarge && "w-6 h-6",
          assigns.colour == :main &&
            "stroke-hs_white",
          assigns.colour == :neutral &&
            "stroke-hs_neutral_600"
        ],
        button_class: [
          "phx-submit-loading:opacity-75 flex items-center justify-center rounded-lg",
          assigns.size == :small && "p-2 h-9 w-9",
          assigns.size == :medium && "p-2.5 h-10 w-10",
          assigns.size == :large && "p-3 h-11 w-11",
          assigns.size == :xlarge && "p-3.5 h-12 w-12",
          assigns.size == :xxlarge && "p-4.5 h-[3.75rem] w-[3.75rem]",
          assigns.colour == :main &&
            "bg-hs_main_600 hover:bg-hs_main_500 border border-hs_main_600 phx-click-loading:text-hs_white",
          assigns.colour == :neutral &&
            "bg-hs_neutral_50 hover:bg-hs_neutral_100 border border-hs_neutral_200 phx-click-loading:text-hs_neutral_600"
        ]
      )

    ~H"""
    <.link :if={@type == :external} {@rest}>
      <button class={@button_class}>
        <Heroicons.document_duplicate :if={@icon == :copy} class={@icon_class} />
        <Heroicons.envelope :if={@icon == :envelope} class={@icon_class} />
        <Heroicons.cloud_arrow_up :if={@icon == :cloud_arrow_up} class={@icon_class} />
        <Heroicons.cloud_arrow_down :if={@icon == :cloud_arrow_down} class={@icon_class} />
        <Heroicons.no_symbol :if={@icon == :no_symbol} class={@icon_class} />
        <Heroicons.chat_bubble_left_right :if={@icon == :chat_bubble_left_right} class={@icon_class} />
        <Heroicons.minus :if={@icon == :minus} class={@icon_class} />
        <Heroicons.plus :if={@icon == :plus} class={@icon_class} />
        <Heroicons.check :if={@icon == :check} class={@icon_class} />
        <Heroicons.chat_bubble_oval_left :if={@icon == :chat_bubble_oval_left} class={@icon_class} />
        <Heroicons.x_mark :if={@icon == :x_mark} class={@icon_class} />
        <Heroicons.printer :if={@icon == :printer} class={@icon_class} />
        <Heroicons.pencil_square :if={@icon == :pencil_square} class={@icon_class} />
        <Heroicons.arrow_top_right_on_square
          :if={@icon == :arrow_top_right_on_square}
          class={@icon_class}
        />
        <Heroicons.trash :if={@icon == :trash} class={@icon_class} />
        <Heroicons.bars_3 :if={@icon == :bars_3} class={@icon_class} />
        <Heroicons.phone :if={@icon == :phone} class={@icon_class} />
        <Heroicons.paper_airplane :if={@icon == :paper_airplane} class={@icon_class} />
        <Heroicons.ellipsis_vertical :if={@icon == :ellipsis_vertical} class={@icon_class} />
        <Heroicons.chevron_down :if={@icon == :chevron_down} class={@icon_class} />
        <Heroicons.magnifying_glass :if={@icon == :magnifying_glass} class={@icon_class} />

        <Heroicons.arrow_left :if={@icon == :arrow_left} class={@icon_class} />
        <Heroicons.document_chart_bar :if={@icon == :document_chart_bar} class={@icon_class} />
        <Heroicons.heart :if={@icon == :heart} class={@icon_class} />
        <Heroicons.bookmark :if={@icon == :bookmark} class={@icon_class} />
      </button>
    </.link>
    <button :if={@type == :app} class={@button_class} {@rest}>
      <Heroicons.document_duplicate :if={@icon == :copy} class={@icon_class} />
      <Heroicons.envelope :if={@icon == :envelope} class={@icon_class} />
      <Heroicons.cloud_arrow_up :if={@icon == :cloud_arrow_up} class={@icon_class} />
      <Heroicons.cloud_arrow_down :if={@icon == :cloud_arrow_down} class={@icon_class} />
      <Heroicons.no_symbol :if={@icon == :no_symbol} class={@icon_class} />
      <Heroicons.chat_bubble_left_right :if={@icon == :chat_bubble_left_right} class={@icon_class} />
      <Heroicons.minus :if={@icon == :minus} class={@icon_class} />
      <Heroicons.plus :if={@icon == :plus} class={@icon_class} />
      <Heroicons.check :if={@icon == :check} class={@icon_class} />
      <Heroicons.chat_bubble_oval_left :if={@icon == :chat_bubble_oval_left} class={@icon_class} />
      <Heroicons.x_mark :if={@icon == :x_mark} class={@icon_class} />
      <Heroicons.printer :if={@icon == :printer} class={@icon_class} />
      <Heroicons.pencil_square :if={@icon == :pencil_square} class={@icon_class} />
      <Heroicons.arrow_top_right_on_square
        :if={@icon == :arrow_top_right_on_square}
        class={@icon_class}
      />
      <Heroicons.trash :if={@icon == :trash} class={@icon_class} />
      <Heroicons.bars_3 :if={@icon == :bars_3} class={@icon_class} />
      <Heroicons.phone :if={@icon == :phone} class={@icon_class} />
      <Heroicons.paper_airplane :if={@icon == :paper_airplane} class={@icon_class} />
      <Heroicons.ellipsis_vertical :if={@icon == :ellipsis_vertical} class={@icon_class} />
      <Heroicons.chevron_down :if={@icon == :chevron_down} class={@icon_class} />
      <Heroicons.magnifying_glass :if={@icon == :magnifying_glass} class={@icon_class} />

      <Heroicons.arrow_left :if={@icon == :arrow_left} class={@icon_class} />
      <Heroicons.document_chart_bar :if={@icon == :document_chart_bar} class={@icon_class} />
      <Heroicons.heart :if={@icon == :heart} class={@icon_class} />
      <Heroicons.bookmark :if={@icon == :bookmark} class={@icon_class} />
    </button>
    """
  end
end
