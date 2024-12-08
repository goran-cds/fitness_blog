defmodule FitnessBlogWeb.Live.Blog.Index do
  use FitnessBlogWeb, :live_view

  import FitnessBlogWeb.Components.Web.Layout.PageLayout

  def mount(_, _, socket) do
    blogs = [
      %{
        title: "10 Tips to Build Muscle Fast",
        description:
          "Discover the best strategies for gaining muscle mass, including nutrition and training techniques.",
        img_index: 1,
        category: :bodybuilding
      },
      %{
        title: "Yoga for Stress Relief",
        description:
          "Explore how yoga can help you unwind, reduce stress, and improve your mental well-being.",
        img_index: 2,
        category: :yoga
      },
      %{
        title: "5 CrossFit Workouts to Boost Strength",
        description:
          "Push your limits with these top CrossFit routines designed to build strength and endurance.",
        img_index: 3,
        category: :crossfit
      },
      %{
        title: "Pilates for Core Strength",
        description:
          "Learn how Pilates can enhance your core strength, improve posture, and support overall fitness.",
        img_index: 4,
        category: :pilates
      },
      %{
        title: "The Basics of Boxing for Beginners",
        description:
          "Step into the ring with confidence! A beginner’s guide to boxing fundamentals.",
        img_index: 5,
        category: :boxing
      },
      %{
        title: "Cardio Workouts to Burn Fat",
        description: "Maximize your fat-burning potential with these effective cardio exercises.",
        img_index: 6,
        category: :cardio
      },
      %{
        title: "Zumba: Dance Your Way to Fitness",
        description:
          "Enjoy a fun and energetic way to stay fit with these Zumba routines for all levels.",
        img_index: 7,
        category: :zumba
      }
    ]

    socket = assign(socket, blogs: blogs, all_blogs: blogs, search_query: "")
    {:ok, socket}
  end

  def handle_event("search", %{"search" => search_query}, socket) do
    filtered_blogs =
      Enum.filter(socket.assigns.all_blogs, fn blog ->
        String.contains?(String.downcase(blog.title), String.downcase(search_query))
      end)

    {:noreply, assign(socket, search_query: search_query, blogs: filtered_blogs)}
  end

  def handle_event("filter_by_category", %{"category" => category}, socket) do
    category_atom = String.to_existing_atom(category)

    filtered_blogs =
      if category_atom == :all do
        socket.assigns.all_blogs
      else
        Enum.filter(socket.assigns.all_blogs, fn blog ->
          blog.category == category_atom
        end)
      end

    {:noreply, assign(socket, blogs: filtered_blogs)}
  end

  def render(assigns) do
    ~H"""
    <.page_layout topbar_opts={[page_selected: :blog]}>
      <div class="relative min-h-screen w-full">
        <!-- Banner -->
        <div class="w-full h-48 relative">
          <div class="absolute inset-x-1/4 inset-y-8 z-10 flex flex-col items-start gap-8">
            <h1 class="text-5xl text-app_white font-bold">
              WELCOME TO OUR
              <span class="underline text-app_main_500 hover:text-app_white transition-all duration-300 ease-in-out">
                BLOG
              </span>
            </h1>
          </div>
          <div
            class="absolute inset-0"
            style="background-image: url('/images/artwork/banner-6.jpg'); background-size: cover; background-position: 0% 20%; filter: grayscale(100%);"
          >
          </div>
          <!-- Transparent Overlay -->
          <div class="absolute inset-0 bg-app_black bg-opacity-80"></div>
        </div>
        <div class="bg-app_white w-full flex flex-col lg:flex-row">
          <div class="lg:hidden flex flex-col gap-4 w-full py-16 px-4 2xl:px-16">
            <.simple_form for={%{}} phx-change="search" class="w-full 2xl:w-1/2">
              <.input
                type="text"
                name="search"
                placeholder="Search blog posts..."
                value={@search_query}
                class="w-full border border-gray-300 rounded-lg px-4 py-2"
              />
            </.simple_form>
            <div class="bg-app_neutral_100 w-full 2xl:w-1/2 flex flex-col gap-4 items-start p-4">
              <h1 class="text-app_neutral_800 font-bold text-lg">Categories</h1>
              <div class="bg-app_main_500 h-0.5 w-16"></div>
              <div class="grid grid-cols-2 sm:grid-cols-3 gap-2">
                <%= for category <- [:all, :bodybuilding, :yoga, :crossfit, :pilates, :boxing, :cardio, :zumba] do %>
                  <button
                    phx-click="filter_by_category"
                    phx-value-category={category}
                    class="px-4 py-2 rounded-md bg-app_neutral_100 shadow-sm text-app_neutral_600 hover:bg-app_main_500 hover:text-app_white transition-all duration-200"
                  >
                    <%= Phoenix.Naming.humanize(Atom.to_string(category)) %>
                  </button>
                <% end %>
              </div>
            </div>
          </div>
          <div class="w-full 2xl:w-1/2 flex flex-col items-end max-lg:py-0 max-lg:pb-8 py-16 gap-8">
            <%= for blog <- @blogs do %>
              <.blog_card
                title={blog.title}
                description={blog.description}
                img_index={blog.img_index}
                category={blog.category}
              />
            <% end %>
          </div>
          <div class="max-lg:hidden flex flex-col gap-4 w-1/2 py-16 px-4 2xl:px-16">
            <.simple_form for={%{}} phx-change="search" class="w-full 2xl:w-1/2">
              <.input
                type="text"
                name="search"
                placeholder="Search blog posts..."
                value={@search_query}
                class="w-full border border-gray-300 rounded-lg px-4 py-2"
              />
            </.simple_form>
            <div class="bg-app_neutral_100 w-full 2xl:w-1/2 flex flex-col gap-4 items-start p-4">
              <h1 class="text-app_neutral_800 font-bold text-lg">Categories</h1>
              <div class="bg-app_main_500 h-0.5 w-16"></div>
              <div class="grid grid-cols-3 gap-2">
                <%= for category <- [:all, :bodybuilding, :yoga, :crossfit, :pilates, :boxing, :cardio, :zumba] do %>
                  <button
                    phx-click="filter_by_category"
                    phx-value-category={category}
                    class="px-4 py-2 rounded-md bg-app_neutral_100 shadow-sm text-app_neutral_600 hover:bg-app_main_500 hover:text-app_white transition-all duration-200"
                  >
                    <%= Phoenix.Naming.humanize(Atom.to_string(category)) %>
                  </button>
                <% end %>
              </div>
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

  attr :category, :atom,
    values: [:bodybuilding, :yoga, :crossfit, :pilates, :boxing, :cardio, :zumba]

  def blog_card(assigns) do
    ~H"""
    <div class="flex flex-col gap-1 items-start w-full px-4 lg:px-0 lg:w-[700px] 2xl:w-[600px]">
      <div class="overflow-hidden w-full">
        <img
          src={"/images/artwork/blog-#{@img_index}.jpg"}
          class="w-full hover:scale-110 transition-all duration-500 ease-in-out"
        />
      </div>
      <div class="pt-4 flex items-center gap-2">
        <img src="/images/artwork/avatar-1.jpg" class="w-6" />
        <p class="text-app_neutral_500">
          By <span class="text-app_neutral_800 font-bold">Admin</span> | March 22, 2024 |
        </p>
        <p class="font-semibold text-app_neutral_600 bg-app_neutral_200 rounded-xl px-2 py-0.5">
          <%= @category %>
        </p>
      </div>
      <h1 class="text-3xl text-app_neutral_800 font-bold"><%= @title %></h1>
      <p class="w-2/3 text-md text-app_neutral_500"><%= @description %></p>
      <.link
        navigate={~p"/blog"}
        class="mt-8 bg-app_main_500 text-app_white px-6 py-3 rounded-lg flex items-center justify-center transition-all duration-300 ease-in-out hover:translate-x-2"
        style="font-weight: 500;"
      >
        READ MORE
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
    """
  end
end
