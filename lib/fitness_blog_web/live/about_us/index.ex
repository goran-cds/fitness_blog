defmodule FitnessBlogWeb.Live.AboutUs.Index do
  use FitnessBlogWeb, :live_view

  import FitnessBlogWeb.Components.Web.Layout.PageLayout

  def mount(_, _, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <.page_layout topbar_opts={[page_selected: :about]}>
      <div class="relative min-h-screen w-full">
        <!-- Banner -->
        <div class="w-full h-48 relative">
          <div class="absolute inset-x-1/4 inset-y-8 z-10 flex flex-col items-start gap-1 sm:gap-8">
            <h1 class="text-2xl sm:text-5xl text-app_white font-bold">
              WE CHASE ONLY
              <span class="underline text-app_main_500 hover:text-app_white transition-all duration-300 ease-in-out">
                RESULTS.
              </span>
            </h1>
            <div class="flex items-center gap-3 sm:gap-6">
              <img src={~p"/images/icons/facebook-logo.svg"} class="w-6 hover:cursor-pointer" />
              <img src={~p"/images/icons/instagram-logo.svg"} class="w-4 hover:cursor-pointer" />
              <img src={~p"/images/icons/tiktok-logo.svg"} class="w-4 hover:cursor-pointer" />
              <div class="h-0.5 w-12 bg-app_main_500"></div>
              <p class="text-sm text-app_white">CONNECT WITH US</p>
            </div>
          </div>
          <div
            class="absolute inset-0"
            style="background-image: url('/images/artwork/banner-2.jpg'); background-size: cover; background-position: 50% 45%; filter: grayscale(100%);"
          >
          </div>
          <!-- Transparent Overlay -->
          <div class="absolute inset-0 bg-app_black bg-opacity-80"></div>
        </div>
        <div class="bg-app_white w-full flex flex-col gap-y-16 items-center pb-16">
          <div class="flex flex-col sm:flex-row items-start gap-8 w-full px-8 2xl:px-0 2xl:w-1/2 py-16">
            <div
              class="w-full h-[512px] lg:h-96 bg-cover bg-center bg-[length:180%] 2xl:bg-[length:200%] 3xl:bg-[length:100%] bg-[position:45%_55%]"
              style="background-image: url('/images/artwork/card-1.jpg');"
            >
            </div>
            <div class="flex flex-col max-sm:w-full max-lg:w-3/4 gap-4 items-start justify-center">
              <div>
                <div class="relative inline-block px-2 pt-0.5">
                  <p class="text-sm text-app_white relative z-10">WHO WE ARE</p>
                  <span class="absolute inset-0 bg-red-500 -rotate-2 w-full h-[1.5em] rounded-sm">
                  </span>
                </div>
                <h1 class="text-4xl font-bold text-app_black pt-6">
                  We Will Give You Strength and Health
                </h1>
              </div>
              <p class="text-lg text-app_neutral_500">
                We're a team of certified personal trainers committed to helping you achieve your fitness goals. With personalized training and expert guidance, we'll motivate and support you every step of the way. Let's unlock your full potential together!
              </p>
              <.link
                navigate={~p"/about"}
                class="mt-8 bg-app_main_500 text-app_white px-6 py-3 rounded-lg flex items-center justify-center transition-all duration-300 ease-in-out hover:translate-x-2"
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
          </div>
          <div class="flex flex-col sm:flex-row items-center gap-4 px-4 lg:px-0 lg:gap-12 2xl:gap-6">
            <.small_card title="10+" description="Expert Trainers" img_index={3} />
            <.small_card title="1.000+" description="Total Clients" img_index={2} />
          </div>
          <div class="grid grid-cols-1 sm:grid-cols-2 w-full px-8 2xl:px-0 2xl:w-1/2 shadow-2xl pt-16">
            <div class="flex flex-col items-center justify-center gap-2 max-sm:py-4 px-8 hover:cursor-pointer group">
              <img src={~p"/images/icons/asset-7.svg"} class="w-16 sm:w-24" />
              <h1 class="text-3xl sm:text-5xl text-app_black font-bold transition-colors duration-300 group-hover:underline">
                Our history
              </h1>
              <p class="text-app_neutral_400 text-center">
                From humble beginnings to a thriving community, we've been passionate about helping individuals transform their lives through fitness. Our journey is about dedication, growth, and the belief that everyone deserves the tools to achieve their health goals.
              </p>
            </div>
            <div class="max-sm:hidden relative overflow-hidden group">
              <img
                src={~p"/images/artwork/card-2.jpg"}
                class="w-full h-full object-cover transition-transform duration-500 transform group-hover:scale-110 "
              />
            </div>
            <div class="relative overflow-hidden group">
              <img
                src={~p"/images/artwork/card-3.jpg"}
                class="w-full h-full object-cover transition-transform duration-500 transform group-hover:scale-110 "
              />
            </div>
            <div class="flex flex-col items-center justify-center gap-2 max-sm:py-4 px-8 hover:cursor-pointer group">
              <img src={~p"/images/icons/asset-8.svg"} class="w-16 sm:w-24" />
              <h1 class="text-3xl sm:text-5xl text-app_black font-bold transition-colors duration-300 group-hover:underline">
                Our mission
              </h1>
              <p class="text-app_neutral_400 text-center">
                To inspire and empower people to lead healthier, stronger lives by providing expert guidance, proven strategies, and a supportive environment for every step of their fitness journey.
              </p>
            </div>
          </div>
          <div class="flex flex-col items-center justify-center gap-2">
            <div class="flex flex-col items-center">
              <div class="w-24 relative inline-block px-2 pt-0.5">
                <p class="text-sm text-app_white relative z-10">OUR TEAM</p>
                <span class="absolute inset-0 bg-red-500 -rotate-2 w-full h-[1.5em] rounded-sm">
                </span>
              </div>
              <h1 class="max-sm:text-center text-4xl font-bold text-app_black pt-2">
                Team of expert coaches
              </h1>
            </div>
            <p class="text-sm text-app_neutral_500">Meet the most experienced personal trainers</p>
            <div class="grid grid-cols-1 sm:grid-cols-3 lg:grid-cols-5 gap-8">
              <div class="max-lg:hidden"></div>
              <div class="relative group max-sm:w-3/4 max-sm:mx-auto">
                <img
                  src={~p"/images/artwork/stroke-3.png"}
                  class="absolute top-4 w-full rotate-45 filter grayscale group-hover:grayscale-0 transition-all duration-300"
                />
                <img
                  src={~p"/images/artwork/cutout-2.png"}
                  class="filter grayscale group-hover:grayscale-0 transition-all duration-300"
                />
                <div class="flex flex-col items-center shadow-xl rounded-lg pb-4">
                  <Heroicons.chevron_up class="text-app_black w-6" />
                  <h1 class="font-bold text-xl text-app_black">Matt Smith</h1>
                  <p class="text-sm text-app_neutral_500">Fitness trainer</p>
                  <div class="flex items-center gap-3 pt-4">
                    <img
                      src={~p"/images/icons/facebook-logo-black.svg"}
                      class="w-5 hover:cursor-pointer"
                    />
                    <img
                      src={~p"/images/icons/instagram-logo-black.svg"}
                      class="w-5 hover:cursor-pointer"
                    />
                    <img
                      src={~p"/images/icons/tiktok-logo-black.svg"}
                      class="w-5 hover:cursor-pointer"
                    />
                  </div>
                </div>
              </div>
              <div class="relative group max-sm:w-3/4 max-sm:mx-auto">
                <img
                  src={~p"/images/artwork/stroke-3.png"}
                  class="absolute top-4 w-full rotate-45 filter grayscale group-hover:grayscale-0 transition-all duration-300"
                />
                <img
                  src={~p"/images/artwork/cutout-3.png"}
                  class="filter grayscale group-hover:grayscale-0 transition-all duration-300"
                />
                <div class="flex flex-col items-center shadow-xl rounded-lg pb-4">
                  <Heroicons.chevron_up class="text-app_black w-6" />
                  <h1 class="font-bold text-xl text-app_black">John & Jane Doe</h1>
                  <p class="text-sm text-app_neutral_500">Yoga trainers</p>
                  <div class="flex items-center gap-3 pt-4">
                    <img
                      src={~p"/images/icons/facebook-logo-black.svg"}
                      class="w-5 hover:cursor-pointer"
                    />
                    <img
                      src={~p"/images/icons/instagram-logo-black.svg"}
                      class="w-5 hover:cursor-pointer"
                    />
                    <img
                      src={~p"/images/icons/tiktok-logo-black.svg"}
                      class="w-5 hover:cursor-pointer"
                    />
                  </div>
                </div>
              </div>
              <div class="relative group max-sm:w-3/4 max-sm:mx-auto">
                <img
                  src={~p"/images/artwork/stroke-3.png"}
                  class="absolute top-4 w-full rotate-45 filter grayscale group-hover:grayscale-0 transition-all duration-300"
                />
                <img
                  src={~p"/images/artwork/cutout-4.png"}
                  class="filter grayscale group-hover:grayscale-0 transition-all duration-300"
                />
                <div class="flex flex-col items-center shadow-xl rounded-lg pb-4">
                  <Heroicons.chevron_up class="text-app_black w-6" />
                  <h1 class="font-bold text-xl text-app_black">Chris Fit</h1>
                  <p class="text-sm text-app_neutral_500">Bodybuilding prep</p>
                  <div class="flex items-center gap-3 pt-4">
                    <img
                      src={~p"/images/icons/facebook-logo-black.svg"}
                      class="w-5 hover:cursor-pointer"
                    />
                    <img
                      src={~p"/images/icons/instagram-logo-black.svg"}
                      class="w-5 hover:cursor-pointer"
                    />
                    <img
                      src={~p"/images/icons/tiktok-logo-black.svg"}
                      class="w-5 hover:cursor-pointer"
                    />
                  </div>
                </div>
              </div>
              <div></div>
            </div>
          </div>
        </div>
      </div>
    </.page_layout>
    """
  end

  attr :title, :string
  attr :description, :string
  attr :img_index, :integer

  def small_card(assigns) do
    ~H"""
    <div class="flex items-center bg-white shadow-lg rounded-lg overflow-hidden max-w-md group">
      <!-- Left Section -->
      <div class="flex flex-col justify-center items-start w-1/2 p-6">
        <h2 class="text-4xl font-bold text-black"><%= @title %></h2>
        <p class="text-gray-500"><%= @description %></p>
      </div>
      <!-- Right Section -->
      <div
        class="relative w-1/2 bg-black"
        style="clip-path: polygon(10% 0, 100% 0, 100% 100%, 0% 100%);"
      >
        <img
          src={"/images/artwork/small-card-#{@img_index}.jpg"}
          alt="Fitness Trainer"
          class="w-full h-full object-cover opacity-90 transform transition-transform duration-500 group-hover:scale-110 filter grayscale"
        />
        <!-- Red, White, and Black Accents -->
        <div class="absolute top-1/2 -left-4 flex gap-1" style="transform: rotate(-80deg);">
          <span class="block w-12 h-1 bg-app_main_500 transition-colors duration-300 group-hover:bg-app_white">
          </span>
          <span class="block w-6 h-1 bg-app_white transition-colors duration-300 group-hover:bg-app_main_500">
          </span>
        </div>
      </div>
    </div>
    """
  end
end
