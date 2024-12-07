defmodule FitnessBlogWeb.Live.LandingPage.Index do
  use FitnessBlogWeb, :live_view

  import FitnessBlogWeb.Components.Web.Layout.PageLayout

  def mount(_, _, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <.page_layout topbar_opts={[page_selected: :home]}>
      <div class="relative min-h-screen w-full">
        <!-- Background Image -->
        <div
          class="absolute inset-0 bg-cover bg-center"
          style="background-image: url('/images/artwork/bg_v7.jpg');"
        >
        </div>
        <!-- Main Content -->
        <div class="relative z-10 min-h-screen grid grid-cols-12 sm:grid-cols-7 lg:grid-cols-6">
          <div></div>
          <div></div>
          <div></div>
          <div class="flex flex-col items-start justify-center col-span-8 sm:col-span-3 lg:col-span-2 pb-36 px-4 lg:px-16">
            <div class="relative inline-block px-4 pt-0.5">
              <p class="text-sm text-app_black relative z-10">UNLEASH YOUR STRENGTH</p>
              <span
                class="absolute inset-0 bg-app_white -rotate-2 w-2/3 sm:w-full h-[3rem] sm:h-[1.5em]"
                style="clip-path: polygon(5% 0%, 95% 0%, 100% 60%, 95% 100%, 10% 90%, 0% 40%);"
              >
              </span>
            </div>

            <h1
              class="text-2xl 2xl:text-5xl font-bold text-app_neutral_50 text-left pt-4"
              style="filter: drop-shadow(0 5px 15px rgb(0 0 0 / 0.8));"
            >
              START YOUR FITNESS JOURNEY NOW!
            </h1>
            <p
              class="text-md 2xl:text-xl text-app_neutral_50"
              style="filter: drop-shadow(0 2px 3px rgb(0 0 0 / 0.8));"
            >
              STAY FIT, STAY HEALTHY & STAY MOTIVATED
            </p>
            <.link
              navigate={~p"/blog"}
              class="mt-8 bg-app_white text-app_main_950 px-2 sm:px-6 py-3 rounded-lg flex items-center justify-center hover:shadow-[8px_-8px_12px_#FFB200] transition-all duration-300 ease-in-out hover:translate-x-2"
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
      <div class="relative bg-app_white w-full flex flex-col items-center">
        <div
          id="cards"
          class="max-sm:hidden absolute -top-16 grid grid-cols-3 gap-4 w-full max-lg:px-4 lg:w-3/4 2xl:w-1/2"
        >
          <.card
            title="PROGRESSION"
            description="We'll track your fitness journey and celebrate every milestone. Our progression tools help you monitor your growth and push yourself to new heights."
            img_index={4}
          />
          <.card
            title="WORKOUT"
            description="Explore tailored workout plans designed to challenge your body and build strength. Whether you're a beginner or an athlete, we have something for you."
            img_index={5}
          />
          <.card
            title="NUTRITION"
            description="Fuel your body with the right nutrients. Our nutrition guides and meal plans will help you stay on track for a healthier, more energized lifestyle."
            img_index={6}
          />
        </div>
        <div id="cards" class="sm:hidden grid grid-cols-1 gap-4 w-full max-lg:px-4 lg:w-3/4 2xl:w-1/2">
          <.card
            title="PROGRESSION"
            description="We'll track your fitness journey and celebrate every milestone. Our progression tools help you monitor your growth and push yourself to new heights."
            img_index={4}
          />
          <.card
            title="WORKOUT"
            description="Explore tailored workout plans designed to challenge your body and build strength. Whether you're a beginner or an athlete, we have something for you."
            img_index={5}
          />
          <.card
            title="NUTRITION"
            description="Fuel your body with the right nutrients. Our nutrition guides and meal plans will help you stay on track for a healthier, more energized lifestyle."
            img_index={6}
          />
        </div>

        <div class="h-[50px] sm:h-[250px]"></div>

        <div class="flex items-end gap-4 w-full w-full max-lg:px-4 lg:w-3/4 2xl:w-1/2 pt-8 pb-16">
          <div class="flex flex-col gap-8 items-start justify-center">
            <div>
              <div class="relative inline-block px-2 pt-0.5">
                <p class="text-sm text-app_white relative z-10">START NOW</p>
                <span class="absolute inset-0 bg-red-500 -rotate-2 w-full h-[1.5em] rounded-sm">
                </span>
              </div>
              <h1 class="max-sm:w-full max-sm:px-2 max-sm:text-center max-sm:mx-auto text-4xl font-bold text-app_black pt-4">
                Take Your Health And Body To The Next Level
              </h1>
            </div>
            <p class="max-sm:w-full max-sm:px-2 max-sm:text-center max-sm:mx-auto text-md text-app_neutral_500">
              Discover personalized fitness strategies and expert guidance tailored to help you achieve your health goals. Whether you're aiming to build strength, boost endurance, or transform your physique, our team of dedicated trainers provides the tools and motivation you need to take your fitness journey to new heights.
            </p>
            <div class="flex max-sm:flex-col max-sm:mx-auto items-center gap-8 lg:gap-2 3xl:gap-8 py-4">
              <div class="flex flex-col items-center gap-2 hover:cursor-pointer">
                <img
                  src={~p"/images/icons/asset-1.svg"}
                  class="w-16 transition-transform duration-300 ease-in-out hover:scale-110"
                />
                <p class="text-app_blac font-bold text-center text-lg leading-[120%] hover:text-app_main_500">
                  Professional trainers
                </p>
              </div>
              <div class="flex flex-col items-center gap-2 hover:cursor-pointer">
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
              navigate={~p"/about"}
              class="mt-8 bg-app_neutral_600 text-app_white px-6 py-3 rounded-lg flex items-center justify-center transition-all duration-300 ease-in-out hover:translate-x-2"
              style="font-weight: 500;"
            >
              FIND MORE
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
          <img src={~p"/images/artwork/cutout-1.png"} class="max-lg:hidden w-[500px]" />
        </div>
        <div class="h-[150px] lg:h-[250px]"></div>
      </div>

      <%!-- TERTIARY CONTENT --%>
      <div class="relative bg-app_black w-full flex flex-col items-center">
        <div
          class="absolute -top-24 left-0 bg-gradient-to-r from-app_main_500 to-app_main_700 h-44 w-full lg:w-2/3 flex max-sm:flex-col max-sm:space-y-4 max-sm:items-start sm:items-center max-sm:p-4"
          style="clip-path: polygon(0 0, 100% 0%, 80% 100%, 0% 100%);"
        >
          <p class="px-0 sm:px-8 w-full sm:w-[60%] text-app_white font-bold text-xl sm:text-3xl 2xl:text-5xl">
            We Always Provide The Best Fitness Service For You
          </p>
          <.link
            navigate={~p"/contact"}
            class="bg-app_white text-app_main_950 px-6 py-3 rounded-lg flex items-center justify-center transition-all duration-300 ease-in-out hover:translate-x-2"
            style="font-weight: 500;"
          >
            CONTACT US
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
        <div class="h-[150px]"></div>
        <div class="flex max-lg:flex-col items-start gap-8 w-full px-4 lg:px-0 lg:w-3/4 2xl:w-1/2 pt-8 pb-24">
          <div class="relative w-full h-[564px] bg-black rounded-lg shadow-lg">
            <div class="absolute inset-0 border-4 border-app_white rounded-lg transform translate-z-1">
              <iframe
                src="https://www.youtube.com/embed/4NAs175XW_0?si=wxOlmQsJn2vgNAzd"
                class="w-full h-full rounded-md"
                frameborder="0"
                allowfullscreen
              >
              </iframe>
            </div>
          </div>
          <div class="flex flex-col gap-8 items-start justify-center">
            <div>
              <div class="relative inline-block px-2 pt-0.5">
                <p class="text-sm text-app_black relative z-10">WHY CHOOSE US</p>
                <span class="absolute inset-0 bg-app_white -rotate-2 w-full h-[1.5em] rounded-sm">
                </span>
              </div>
              <h1 class="text-4xl font-bold text-app_white pt-4">
                We'll put you in the <span class="underline hover:text-app_main_500">BEST</span>
                shape of your life!
              </h1>
            </div>
            <p class="text-md text-app_neutral_400">
              We're a team of certified personal trainers committed to helping you achieve your fitness goals. With personalized training and expert guidance, we'll motivate and support you every step of the way. Let's unlock your full potential together!
            </p>
            <div class="grid grid-cols-2 gap-6 py-4">
              <div class="flex flex items-center gap-2 hover:cursor-pointer">
                <div class="bg-app_neutral_600 hover:bg-app_main_500 w-16 p-3 rounded-full">
                  <img
                    src={~p"/images/icons/asset-12.svg"}
                    class="w-full transition-transform duration-300 ease-in-out hover:scale-110"
                  />
                </div>
                <p class="text-app_white font-bold text-left text-lg leading-[120%] hover:text-app_main_500">
                  Professional trainers
                </p>
              </div>
              <div class="flex flex items-center gap-2 hover:cursor-pointer">
                <div class="bg-app_neutral_600 hover:bg-app_main_500 w-16 p-3 rounded-full">
                  <img
                    src={~p"/images/icons/asset-11.svg"}
                    class="w-full transition-transform duration-300 ease-in-out hover:scale-110"
                  />
                </div>
                <p class="text-app_white font-bold text-left text-lg leading-[120%] hover:text-app_main_500">
                  Tailored programs
                </p>
              </div>
              <div class="flex flex items-center gap-2 hover:cursor-pointer">
                <div class="bg-app_neutral_600 hover:bg-app_main_500 w-16 p-3 rounded-full">
                  <img
                    src={~p"/images/icons/asset-10.svg"}
                    class="w-full transition-transform duration-300 ease-in-out hover:scale-110"
                  />
                </div>
                <p class="text-app_white font-bold text-left text-lg leading-[120%] hover:text-app_main_500">
                  Perfect diet
                </p>
              </div>
              <div class="flex flex items-center gap-2 hover:cursor-pointer">
                <div class="bg-app_neutral_600 hover:bg-app_main_500 w-16 p-3 rounded-full">
                  <img
                    src={~p"/images/icons/asset-9.svg"}
                    class="w-full transition-transform duration-300 ease-in-out hover:scale-110"
                  />
                </div>
                <p class="text-app_white font-bold text-left text-lg leading-[120%] hover:text-app_main_500">
                  Consistency
                </p>
              </div>
            </div>
            <.link
              navigate={~p"/services"}
              class="mt-0 lg:mt-8 bg-app_neutral_600 text-app_white px-6 py-3 rounded-lg flex items-center justify-center transition-all duration-300 ease-in-out hover:translate-x-2"
              style="font-weight: 500;"
            >
              OUR SERVICES
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
    </.page_layout>
    """
  end

  attr :title, :string
  attr :description, :string
  attr :img_index, :integer

  defp card(assigns) do
    ~H"""
    <div class="group text-app_black hover:text-app_white bg-app_white hover:cursor-pointer flex flex-col items-center gap-2 rounded-tl-xl rounded-br-xl p-8 shadow-lg transition-all duration-300 ease-in-out hover:bg-[url('/images/artwork/bg_v3.jpg')] hover:bg-cover hover:bg-center relative">
      <img src={"/images/icons/asset-#{@img_index}.svg"} class="w-12" />
      <h1 class="font-bold text-2xl"><%= @title %></h1>
      <p class="text-sm text-app_neutral_400 text-center transition-opacity duration-300 ease-in-out group-hover:hidden group-hover:invisible">
        <%= @description %>
      </p>
      <button class="hidden group-hover:block bg-app_main_500 text-white px-4 py-2 mt-2 rounded-lg transition-transform duration-300 ease-in-out hover:scale-105">
        Read more
      </button>
    </div>
    """
  end
end
