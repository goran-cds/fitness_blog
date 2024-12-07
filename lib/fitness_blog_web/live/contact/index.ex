defmodule FitnessBlogWeb.Live.Contact.Index do
  use FitnessBlogWeb, :live_view

  alias FitnessBlogWeb.Contact.FormData

  import FitnessBlogWeb.Components.Web.Layout.PageLayout

  def mount(_, _, socket) do
    changeset = FormData.init_changeset(%FormData{})

    {:ok, socket |> assign(form: to_form(changeset))}
  end

  def handle_event("validate", %{"form_data" => form_data}, socket) do
    changeset = FormData.changeset(%FormData{}, form_data) |> Map.put(:action, :validate)

    {:noreply, socket |> assign(form: to_form(changeset))}
  end

  def handle_event("submit", %{"form_data" => form_data}, socket) do
    changeset = FormData.changeset(%FormData{}, form_data) |> Map.put(:action, :validate)

    case changeset.errors do
      [] ->
        {:noreply,
         socket
         |> assign(form: to_form(changeset))
         |> put_flash(:info, "Form submitted successfully!")}

      _ ->
        {:noreply,
         socket
         |> assign(form: to_form(changeset))}
    end
  end

  def render(assigns) do
    ~H"""
    <.page_layout topbar_opts={[page_selected: :contact]}>
      <div class="relative min-h-screen w-full">
        <!-- Banner -->
        <div class="w-full h-48 relative">
          <div class="absolute inset-x-1/4 inset-y-8 z-10 flex flex-col items-start gap-8">
            <h1 class="text-3xl sm:text-5xl text-app_white font-bold">
              NEED HELP? CONTACT
              <span class="underline text-app_main_500 hover:text-app_white transition-all duration-300 ease-in-out">
                US.
              </span>
            </h1>
          </div>
          <div
            class="absolute inset-0"
            style="background-image: url('/images/artwork/banner-4.jpg'); background-size: cover; background-position: 50% 30%; filter: grayscale(100%);"
          >
          </div>
          <!-- Transparent Overlay -->
          <div class="absolute inset-0 bg-app_black bg-opacity-80"></div>
        </div>
        <div class="bg-app_white 2xl:min-h-screen w-full flex flex-col gap-y-16 items-center pb-16">
          <div class="sm:h-[50px]"></div>

          <div class="flex flex-col sm:flex-row items-start gap-4 w-full px-4 md:px-0 md:w-2/3">
            <div class="flex flex-col gap-4 w-full sm:w-1/2 p-4">
              <h1 class="text-app_neutral_800 font-bold text-3xl w-full">
                We are here to help you shape your fitness goals!
              </h1>
              <p class="w-full text-app_neutral_500">
                Ready to reach your fitness goals? Our expert trainers are here to guide and support you every step of the way. Whether it's building strength, losing weight, or boosting confidence, we're in this together.
              </p>
              <div class="grid grid-cols-2 gap-8 w-full">
                <div class="flex flex-col gap-4 items-start">
                  <h1 class="text-xl font-bold text-app_neutral_800">New York City, USA</h1>
                  <div class="bg-app_main_500 h-0.5 w-16"></div>
                  <p class="text-sm text-app_neutral_500">
                    85 Briston Mint Street,<br /> London, E1 8LG, USA
                  </p>
                </div>

                <div class="flex flex-col gap-4 items-start">
                  <h1 class="text-xl font-bold text-app_neutral_800">Opening hours</h1>
                  <div class="bg-app_main_500 h-0.5 w-16"></div>
                  <p class="text-sm text-app_neutral_500">
                    Mon to Fri: 7:00 am — 1:00 am<br /> Sat and Sun: 8:00 am — 23:00 pm
                  </p>
                </div>

                <div class="flex flex-col gap-4 items-start">
                  <h1 class="text-xl font-bold text-app_neutral_800">Information</h1>
                  <div class="bg-app_main_500 h-0.5 w-16"></div>
                  <p class="text-sm text-app_neutral_500">+800-123-4567<br /> fitclub@contact.com</p>
                </div>

                <div class="flex flex-col gap-4 items-start">
                  <h1 class="text-xl font-bold text-app_neutral_800">Follow Us On</h1>
                  <div class="bg-app_main_500 h-0.5 w-16"></div>
                  <div class="flex items-center gap-4">
                    <div class="group w-8 h-8 hover:cursor-pointer bg-app_neutral_200 rounded-full p-1.5 hover:bg-app_main_500">
                      <.facebook_logo />
                    </div>
                    <div class="group w-8 h-8 hover:cursor-pointer bg-app_neutral_200 rounded-full p-1.5 hover:bg-app_main_500">
                      <.instagram_logo />
                    </div>
                    <div class="group w-8 h-8 hover:cursor-pointer bg-app_neutral_200 rounded-full p-1.5 hover:bg-app_main_500">
                      <.tiktok_logo />
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="w-full sm:w-1/2 bg-app_neutral_100 p-4 flex flex-col gap-4">
              <h1 class="text-app_neutral_800 font-bold text-3xl">
                Contact us below
              </h1>
              <div class="bg-app_main_500 h-0.5 w-16"></div>
              <.simple_form for={@form} phx-change="validate" phx-submit="submit">
                <.input field={@form[:name]} type="text" placeholder="Full name*" />
                <.input field={@form[:email]} type="email" placeholder="Email address*" />
                <.input
                  field={@form[:class]}
                  type="select"
                  placeholder="Select class"
                  options={[
                    "Yoga",
                    "Bodybuilding",
                    "Boxing",
                    "Cardio",
                    "Crossfit",
                    "Pilates",
                    "Zumba"
                  ]}
                />
                <.input field={@form[:comment]} type="textarea" placeholder="Comment" />
                <div class="w-full flex justify-center items-center">
                  <.button>SUBMIT</.button>
                </div>
              </.simple_form>
            </div>
          </div>
        </div>
      </div>
    </.page_layout>
    """
  end

  defp facebook_logo(assigns) do
    ~H"""
    <svg
      class="fill-black group-hover:fill-white transition-colors duration-200 w-full h-full"
      width="800px"
      height="800px"
      viewBox="0 0 24 24"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path d="M12 2.03998C6.5 2.03998 2 6.52998 2 12.06C2 17.06 5.66 21.21 10.44 21.96V14.96H7.9V12.06H10.44V9.84998C10.44 7.33998 11.93 5.95998 14.22 5.95998C15.31 5.95998 16.45 6.14998 16.45 6.14998V8.61998H15.19C13.95 8.61998 13.56 9.38998 13.56 10.18V12.06H16.34L15.89 14.96H13.56V21.96C15.9164 21.5878 18.0622 20.3855 19.6099 18.57C21.1576 16.7546 22.0054 14.4456 22 12.06C22 6.52998 17.5 2.03998 12 2.03998Z" />
    </svg>
    """
  end

  defp instagram_logo(assigns) do
    ~H"""
    <svg
      class="fill-black group-hover:fill-white transition-colors duration-200 w-full h-full"
      width="800px"
      height="800px"
      viewBox="0 0 24 24"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path
        fill-rule="evenodd"
        clip-rule="evenodd"
        d="M2 6C2 3.79086 3.79086 2 6 2H18C20.2091 2 22 3.79086 22 6V18C22 20.2091 20.2091 22 18 22H6C3.79086 22 2 20.2091 2 18V6ZM6 4C4.89543 4 4 4.89543 4 6V18C4 19.1046 4.89543 20 6 20H18C19.1046 20 20 19.1046 20 18V6C20 4.89543 19.1046 4 18 4H6ZM12 9C10.3431 9 9 10.3431 9 12C9 13.6569 10.3431 15 12 15C13.6569 15 15 13.6569 15 12C15 10.3431 13.6569 9 12 9ZM7 12C7 9.23858 9.23858 7 12 7C14.7614 7 17 9.23858 17 12C17 14.7614 14.7614 17 12 17C9.23858 17 7 14.7614 7 12ZM17.5 8C18.3284 8 19 7.32843 19 6.5C19 5.67157 18.3284 5 17.5 5C16.6716 5 16 5.67157 16 6.5C16 7.32843 16.6716 8 17.5 8Z"
      />
    </svg>
    """
  end

  defp tiktok_logo(assigns) do
    ~H"""
    <svg
      class="fill-black group-hover:fill-white transition-colors duration-200 w-full h-full"
      width="800px"
      height="800px"
      viewBox="0 0 24 24"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path
        id="primary"
        d="M21,7V9a1,1,0,0,1-1,1,8,8,0,0,1-4-1.08V15.5A6.5,6.5,0,1,1,6.53,9.72a1,1,0,0,1,1.47.9v2.52a.92.92,0,0,1-.28.62,2.49,2.49,0,0,0,2,4.23A2.61,2.61,0,0,0,12,15.35V3a1,1,0,0,1,1-1h2.11a1,1,0,0,1,1,.83A4,4,0,0,0,20,6,1,1,0,0,1,21,7Z"
      >
      </path>
    </svg>
    """
  end
end
