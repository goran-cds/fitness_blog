defmodule FitnessBlogWeb.App.Footer do
  use Phoenix.Component

  attr :color_theme, :atom,
    values: [:dark, :light],
    default: :dark,
    doc: "The type of footer display style"

  def footer(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        case assigns.color_theme do
          :dark ->
            "bg-app_neutral_800 hover:text-app_main_50 text-app_secondary_50 transition duration-300"

          :light ->
            ""
        end
      )

    ~H"""
    <!-- DESKTOP -->
    <div class={[
      @class,
      "z-10 items-center self-stretch hidden xl:flex w-full flex-col max-md:max-w-full relative not-printable"
    ]}>
      <div class={[
        @class,
        "justify-between items-center self-center flex w-[1216px] grow flex-col px-5 py-8"
      ]}>
        <div class="justify-between items-center self-center flex w-full gap-5 max-md:max-w-full max-md:flex-wrap">
          <div class="items-start self-center flex w-full max-w-full justify-start grow gap-8 max-md:flex-wrap max-md:justify-center">
            <div class="text-base leading-[150%] self-stretch">
              © FitClub <%= Date.utc_today().year %>. All rights reserved.
            </div>
            <.link>
              Terms and conditions
            </.link>
            <.link>
              Help support
            </.link>
          </div>
        </div>
      </div>
    </div>
    <!-- MOBILE -->
    <div class={[
      @class,
      "z-10 items-center self-stretch flex xl:hidden w-full flex-col px-5 max-md:max-w-full relative not-printable"
    ]}>
      <div class="text-[#A9B7B9] rounded-3xl w-full py-4">
        <div class="flex items-center justify-between">
          <p class={[@class, "text-lg"]}>
            © FitClub <%= Date.utc_today().year %>. All rights reserved.
          </p>
        </div>
        <div class={[@class, "flex flex-col space-y-6 py-4"]}>
          <.link>
            Thing 1
          </.link>
          <.link>
            Thing 2
          </.link>
          <.link>
            Thing 3
          </.link>
        </div>
      </div>
    </div>
    """
  end
end
