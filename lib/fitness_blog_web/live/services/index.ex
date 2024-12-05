defmodule FitnessBlogWeb.Live.Services.Index do
  use FitnessBlogWeb, :live_view

  import FitnessBlogWeb.Components.Web.Layout.PageLayout

  def mount(_, _, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <.page_layout topbar_opts={[page_selected: :services]}>
      <div class="relative min-h-screen w-full">
        <!-- Banner -->
        <div class="w-full h-48 relative">
          <div class="absolute inset-x-1/4 inset-y-8 z-10 flex flex-col items-start gap-8">
            <h1 class="text-5xl text-app_white font-bold">
              MORE THAN 1000+ SATISFIED CUSTOMERS!
              <span class="underline text-app_main_500 hover:text-app_white transition-all duration-300 ease-in-out">
                JOIN NOW.
              </span>
            </h1>
          </div>
          <div
            class="absolute inset-0"
            style="background-image: url('/images/artwork/banner-3.jpg'); background-size: cover; background-position: 50% 55%; filter: grayscale(100%);"
          >
          </div>
          <!-- Transparent Overlay -->
          <div class="absolute inset-0 bg-app_black bg-opacity-80"></div>
        </div>
        <div
          class="bg-app_white w-full flex flex-col gap-y-16 items-center pb-16"
          style="background-image: url('/images/artwork/banner-7.jpg'); background-size: 125%; background-position: center;"
        >
          <div class="h-[50px]"></div>
          <div class="flex flex-col items-center justify-center gap-2">
            <div class="flex flex-col items-center">
              <div class="w-32 relative inline-block px-2 pt-0.5">
                <p class="text-sm text-app_white relative z-10">PRICING CHART</p>
                <span class="absolute inset-0 bg-red-500 -rotate-2 w-full h-[1.5em] rounded-sm">
                </span>
              </div>
              <h1 class="text-4xl font-bold text-app_black pt-4">
                Exclusive Pricing Plan
              </h1>
            </div>
            <p class="text-sm text-app_neutral_500">
              Choose what fits best for you and the rest we will take care!
            </p>
            <.carousel />
          </div>
        </div>
        <div class="bg-app_white w-full flex flex-col gap-y-16 items-center pb-16">
          <div class="h-[25px]"></div>

          <div class="flex flex-col items-center justify-center gap-2">
            <div class="flex flex-col items-center">
              <div class="w-26 relative inline-block px-2 pt-0.5">
                <p class="text-sm text-app_white relative z-10">TIME TABLE</p>
                <span class="absolute inset-0 bg-red-500 -rotate-2 w-full h-[1.5em] rounded-sm">
                </span>
              </div>
              <h1 class="text-4xl font-bold text-app_black pt-4">
                Weekly Class Schedule
              </h1>
            </div>
            <p class="text-sm text-app_neutral_500">
              Get in touch with our services by taking a look at our session schedule
            </p>
            <.time_table />
            <img src={~p"/images/artwork/cutout-5.png"} class="absolute left-2/3 w-96 z-0" />
          </div>
        </div>
        <script>
          let slideIndex = 1;
          showSlides(slideIndex);

          // Next/previous controls
          function plusSlides(n) {
          showSlides(slideIndex += n);
          }

          // Thumbnail image controls
          function currentSlide(n) {
          showSlides(slideIndex = n);
          }

          function showSlides(n) {
          let i;
          let slides = document.getElementsByClassName("mySlides");
          let dots = document.getElementsByClassName("dot");
          if (n > slides.length) {slideIndex = 1}
          if (n < 1) {slideIndex = slides.length}
          for (i = 0; i < slides.length; i++) {
          slides[i].style.display = "none";
          }
          for (i = 0; i < dots.length; i++) {
          dots[i].className = dots[i].className.replace(" active", "");
          }
          slides[slideIndex-1].style.display = "block";
          dots[slideIndex-1].className += " active";
          }
        </script>
      </div>
    </.page_layout>
    """
  end

  def carousel(assigns) do
    ~H"""
    <div class="flex flex-col items-center gap-4">
      <div class="flex items-center gap-4">
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <div class="slideshow-container">
          <div class="mySlides fade">
            <.card
              title="Beginner"
              img_index={1}
              price={49.99}
              benefits={["8 week workout program", "Weekly meal plan", "24/7 support"]}
            />
          </div>

          <div class="mySlides fade" style="display: none">
            <.card
              title="Advanced"
              img_index={2}
              price={99.99}
              benefits={[
                "16 week workout periodization",
                "Bulking and cutting cycles",
                "Post workout therapy",
                "24/7 support"
              ]}
            />
          </div>

          <div class="mySlides fade" style="display: none">
            <.card
              title="Premium"
              img_index={3}
              price={499.99}
              benefits={[
                "Advanced workouts",
                "Complex meal plan",
                "Bodybuilding prep",
                "DEXA Scans",
                "Advanced tracking",
                "24/7 support"
              ]}
            />
          </div>
        </div>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
      </div>
      <!-- The dots/circles -->
      <div style="text-align:center">
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
      </div>
    </div>
    """
  end

  def time_table(assigns) do
    ~H"""
    <table class="relative">
      <tr>
        <th class="text-app_white" style="background-color: #343a40;"></th>
        <th class="text-app_white" style="background-color: #343a40;">Monday</th>
        <th class="text-app_white" style="background-color: #343a40;">Tuesday</th>
        <th class="text-app_white" style="background-color: #343a40;">Wednesday</th>
        <th class="text-app_white" style="background-color: #343a40;">Thursday</th>
        <th class="text-app_white" style="background-color: #343a40;">Friday</th>
        <th class="text-app_white" style="background-color: #343a40;">Saturday</th>
      </tr>
      <tr>
        <td class="highlight text-app_neutral_400 font-bold" style="background-color: #212529;">
          6:00 - 8:00
        </td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-yellow-400">Yoga</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-1.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Alice</div>
              <div class="tooltip-specialty">Yoga Expert</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
        <td style="background-color: #1c1f23;"></td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-blue-400">Crossfit</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-2.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Bob</div>
              <div class="tooltip-specialty">Crossfit specialist</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-red-400">Cardio</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-3.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Chris</div>
              <div class="tooltip-specialty">Cardio Enthusiast</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
        <td style="background-color: #1c1f23;"></td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-green-400">Pilates</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-4.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Dana</div>
              <div class="tooltip-specialty">Pilates Coach</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
      </tr>
      <tr>
        <td class="highlight text-app_neutral_400 font-bold" style="background-color: #212529;">
          10:30 - 12:30
        </td>
        <td style="background-color: #1c1f23;"></td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-app_main_500">Bodybuilding</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-5.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Eve</div>
              <div class="tooltip-specialty">Bodybuilding Coach</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
        <td style="background-color: #1c1f23;"></td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-yellow-400">Yoga</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-1.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Alice</div>
              <div class="tooltip-specialty">Yoga Expert</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
        <td style="background-color: #1c1f23;"></td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-orange-400">Boxing</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-6.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Frank</div>
              <div class="tooltip-specialty">Boxing coach</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
      </tr>
      <tr>
        <td class="highlight text-app_neutral_400 font-bold" style="background-color: #212529;">
          13:00 - 14:00
        </td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-red-400">Cardio</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-3.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Chris</div>
              <div class="tooltip-specialty">Cardio Enthusiast</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
        <td style="background-color: #1c1f23;"></td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-pink-400">Zumba</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-7.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Grace</div>
              <div class="tooltip-specialty">Zumba Instructor</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
        <td style="background-color: #1c1f23;"></td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-blue-400">Crossfit</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-2.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Bob</div>
              <div class="tooltip-specialty">Crossfit Specialist</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
        <td style="background-color: #1c1f23;"></td>
      </tr>
      <tr>
        <td class="highlight text-app_neutral_400 font-bold" style="background-color: #212529;">
          18:30 - 19:30
        </td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-blue-400">Crossfit</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-2.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Bob</div>
              <div class="tooltip-specialty">Crossfit Specialist</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-pink-400">Zumba</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-7.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Grace</div>
              <div class="tooltip-specialty">Zumba Instructor</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
        <td style="background-color: #1c1f23;"></td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-green-400">Pilates</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-4.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Dana</div>
              <div class="tooltip-specialty">Pilates Coach</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-yellow-400">Yoga</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-1.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Alice</div>
              <div class="tooltip-specialty">Yoga Expert</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
        <td style="background-color: #1c1f23;"></td>
      </tr>
      <tr>
        <td class="highlight text-app_neutral_400 font-bold" style="background-color: #212529;">
          20:00 - 21:00
        </td>
        <td style="background-color: #1c1f23;"></td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-red-400">Cardio</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-3.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Chris</div>
              <div class="tooltip-specialty">Cardio Enthusiast</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-green-400">Pilates</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-4.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Dana</div>
              <div class="tooltip-specialty">Pilates Coach</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
        <td style="background-color: #1c1f23;"></td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-pink-400">Zumba</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-7.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Grace</div>
              <div class="tooltip-specialty">Zumba Instructor</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
        <td style="background-color: #1c1f23;"></td>
      </tr>
      <tr>
        <td class="highlight text-app_neutral_400 font-bold" style="background-color: #212529;">
          21:30 - 22:30
        </td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-green-400">Pilates</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-4.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Dana</div>
              <div class="tooltip-specialty">Pilates Coach</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
        <td style="background-color: #1c1f23;"></td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-orange-400">Boxing</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-6.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Frank</div>
              <div class="tooltip-specialty">Boxing coach</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
        <td style="background-color: #1c1f23;"></td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-app_main_500">Bodybuilding</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-5.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Eve</div>
              <div class="tooltip-specialty">Bodybuilding Coach</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
        <td style="background-color: #1c1f23;" class="tooltip">
          <span class="text-pink-400">Zumba</span>
          <div class="tooltip-content flex items-start py-4">
            <img class="avatar" src={~p"/images/artwork/avatar-7.jpg"} alt="N/A" />
            <div class="tooltip-info flex flex-col items-start">
              <div class="tooltip-name">Grace</div>
              <div class="tooltip-specialty">Zumba Instructor</div>
              <button class="tooltip-button">View Profile</button>
            </div>
          </div>
        </td>
      </tr>
    </table>
    """
  end

  attr :title, :string
  attr :img_index, :integer
  attr :price, :float
  attr :benefits, :list

  def card(assigns) do
    ~H"""
    <div class="max-w-sm mx-auto bg-white rounded-lg shadow-lg h-full group">
      <!-- Image Banner Section -->
      <div class="relative overflow-hidden">
        <img
          src={"/images/artwork/small-card-#{@img_index}.jpg"}
          alt="Pricing Plan Image"
          class="w-full h-48 object-cover grayscale group-hover:grayscale-0 group-hover:scale-110 transition-all duration-500 ease-in-out"
        />
      </div>
      <!-- Pricing Content Section -->
      <div class="flex flex-col h-2/3 justify-between items-center p-6 mb-4">
        <div class="flex flex-col items-center">
          <h2 class="text-xl font-bold text-app_black"><%= @title %></h2>
          <p class="font-bold text-3xl text-app_black mb-4"><%= "$#{@price}" %></p>
          <!-- List of Benefits -->
          <ul class="space-y-2 mb-4">
            <li :for={benefit <- @benefits} class="flex items-center text-sm text-app_neutral_600">
              <Heroicons.check_circle class="w-5 h-5 text-green-500 mr-2" />
              <%= benefit %>
            </li>
          </ul>
        </div>
        <!-- Button to Purchase -->
        <a
          href="#purchase"
          class="block w-full text-center bg-app_main_500 text-white py-3 rounded-lg hover:bg-app_main_600 transition-all duration-300"
        >
          Purchase Now
        </a>
      </div>
    </div>
    """
  end
end
