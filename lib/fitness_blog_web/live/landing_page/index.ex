defmodule FitnessBlogWeb.Live.LandingPage.Index do
  use FitnessBlogWeb, :live_view

  import FitnessBlogWeb.Components.Web.Layout.PageLayout

  def mount(_, _, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <.page_layout>
      <div class="relative min-h-screen w-full">
        <!-- Background Image -->
        <div
          class="absolute inset-0 bg-cover bg-center w-2/3"
          style="background-image: url('/images/artwork/bg_v2.jpg'); background-size: 150%;"
        >
        </div>
        <!-- Main Content -->
        <div class="relative z-10 min-h-screen grid grid-cols-8">
          <div></div>
          <div></div>
          <div></div>
          <div></div>

          <div class="flex flex-col items-start justify-center col-span-4 pb-36 px-16">
            <div class="relative">
              <img src={~p"/images/artwork/stroke-1.png"} class="w-64 -ml-4" />
              <p class="text-sm text-app_black absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-full pl-6 pt-0.5 tracking-widest">
                FIND YOUR ENERGY
              </p>
            </div>

            <h1 class="text-4xl font-bold text-app_neutral_50">START YOUR FITNESS JOURNEY NOW!</h1>
            <p class="text-lg text-app_neutral_50">STAY FIT, STAY HEALTHY & STAY MOTIVATED</p>
            <.link
              navigate={~p"/blog"}
              class="mt-8 bg-app_white text-app_main_950 px-6 py-3 rounded-lg flex items-center justify-center hover:shadow-[8px_-8px_12px_#FF1A1A] transition-all duration-300 ease-in-out hover:translate-x-2"
              style="font-weight: 500;"
            >
              EXPLORE OUR BLOG
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="ml-2 w-5 h-5 transition-transform duration-300 ease-in-out"
                viewBox="0 0 20 20"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M5 10h10M12 5l5 5-5 5" />
              </svg>
            </.link>
          </div>
        </div>
      </div>
      <!-- Secondary Content -->
      <div class="bg-app_white w-full flex flex-col items-center">
        <div class="flex items-start gap-4 w-1/2 py-8">
          <div class="flex flex-col items-start justify-center">
            <div class="relative">
              <img src={~p"/images/artwork/stroke-2.png"} class="w-64 -ml-4" />
              <p class="text-sm text-app_white absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-full pl-6 pt-0.5 tracking-widest">
                WHO WE ARE
              </p>
            </div>
            <h1 class="text-4xl font-bold text-app_black">
              Take Your Health And Body To Next Level
            </h1>
            <p class="text-lg text-app_black">
              We're a team of certified personal trainers committed to helping you achieve your fitness goals. With personalized training and expert guidance, we'll motivate and support you every step of the way. Let's unlock your full potential together!
            </p>
            <div class="flex items-center gap-2 py-4">
              <div class="flex flex-col items-center gap-2 border-r-2 border-r-app_neutral_200 hover:cursor-pointer">
                <img
                  src={~p"/images/icons/asset-1.svg"}
                  class="w-16 transition-transform duration-300 ease-in-out hover:scale-110"
                />
                <p class="text-app_blac font-bold text-center text-lg leading-[120%] hover:text-app_main_500">
                  Professional trainers
                </p>
              </div>
              <div class="flex flex-col items-center gap-2 border-r-2 border-r-app_neutral_200 hover:cursor-pointer">
                <img
                  src={~p"/images/icons/asset-2.svg"}
                  class="w-16 transition-transform duration-300 ease-in-out hover:scale-110"
                />
                <p class="text-app_blac font-bold text-center text-lg leading-[120%] hover:text-app_main_500">
                  Modern equipments
                </p>
              </div>
              <div class="flex flex-col items-center gap-2 hover:cursor-pointer">
                <img
                  src={~p"/images/icons/asset-3.svg"}
                  class="w-16 transition-transform duration-300 ease-in-out hover:scale-110"
                />
                <p class="text-app_blac font-bold text-center text-lg leading-[120%] hover:text-app_main_500">
                  Personalized programs
                </p>
              </div>
            </div>
            <.link
              navigate={~p"/blog"}
              class="mt-8 bg-app_neutral_600 text-app_white px-6 py-3 rounded-lg flex items-center justify-center hover:shadow-[8px_-8px_12px_#FF7070] transition-all duration-300 ease-in-out hover:translate-x-2"
              style="font-weight: 500;"
            >
              TAKE A TOUR
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="ml-2 w-5 h-5 transition-transform duration-300 ease-in-out"
                viewBox="0 0 20 20"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M5 10h10M12 5l5 5-5 5" />
              </svg>
            </.link>
          </div>
          <img src={~p"/images/artwork/cutout-1.png"} class="w-[500px]" />
        </div>
      </div>
    </.page_layout>
    """
  end
end
