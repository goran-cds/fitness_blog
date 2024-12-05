// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const plugin = require("tailwindcss/plugin");
const fs = require("fs");
const path = require("path");

const base_colours = {
  app_neutral_25: "#FAFAFA" /* Light background */,
  app_neutral_50: "#F5F5F5" /* Subtle card background */,
  app_neutral_100: "#EDEDED" /* Borders */,
  app_neutral_200: "#D6D6D6" /* Secondary text */,
  app_neutral_300: "#AFAFAF" /* Placeholder text */,
  app_neutral_400: "#7A7A7A" /* Tertiary text */,
  app_neutral_500: "#555555" /* Body text */,
  app_neutral_600: "#333333" /* Dark headings */,
  app_neutral_700: "#1A1A1A" /* Darker sections */,
  app_neutral_800: "#121212" /* Footer */,
  app_neutral_900: "#0B0B0B" /* Almost black */,
  app_neutral_950: "#000000" /* Pure black */,

  app_main_25: "#FFF5F5" /* Light red tint */,
  app_main_50: "#FFE5E5" /* Subtle highlights */,
  app_main_100: "#FFC7C7" /* Secondary buttons hover */,
  app_main_200: "#FFA3A3" /* Secondary buttons */,
  app_main_300: "#FF7070" /* Active links */,
  app_main_400: "#FF4D4D" /* Primary button hover */,
  app_main_500: "#FF1A1A" /* Primary buttons and accents */,
  app_main_600: "#E00000" /* Hover/Active states */,
  app_main_700: "#B20000" /* Headers or emphasis */,
  app_main_800: "#8C0000" /* Dark accents */,
  app_main_900: "#660000" /* Deep primary */,
  app_main_950: "#4D0000" /* Almost black, deep red */,

  app_secondary_25: "#F3FAF6" /* Light green background */,
  app_secondary_50: "#E6F4EB" /* Subtle highlights */,
  app_secondary_100: "#C8E9D5" /* Secondary buttons hover */,
  app_secondary_200: "#93D9B5" /* Secondary buttons */,
  app_secondary_300: "#59C78C" /* Active links */,
  app_secondary_400: "#2FAA6B" /* Secondary button hover */,
  app_secondary_500: "#178556" /* Primary accents */,
  app_secondary_600: "#136A45" /* Hover/Active states */,
  app_secondary_700: "#0F5338" /* Headers or emphasis */,
  app_secondary_800: "#0B3F2B" /* Dark accents */,
  app_secondary_900: "#092E20" /* Deep secondary */,
  app_secondary_950: "#010d08" /* Almost black, deep green */,

  app_root: "#15181d",
  app_white: "#F0F2F2",
  app_black: "#0D1117",
};

module.exports = {
  content: ["./js/**/*.js", "../lib/*_web.ex", "../lib/*_web/**/*.*ex"],
  theme: {
    extend: {
      colors: {
        app_neutral_25: base_colours.app_neutral_25,
        app_neutral_50: base_colours.app_neutral_50,
        app_neutral_100: base_colours.app_neutral_100,
        app_neutral_200: base_colours.app_neutral_200,
        app_neutral_300: base_colours.app_neutral_300,
        app_neutral_400: base_colours.app_neutral_400,
        app_neutral_500: base_colours.app_neutral_500,
        app_neutral_600: base_colours.app_neutral_600,
        app_neutral_700: base_colours.app_neutral_700,
        app_neutral_800: base_colours.app_neutral_800,
        app_neutral_900: base_colours.app_neutral_900,
        app_neutral_950: base_colours.app_neutral_950,
        app_main_25: base_colours.app_main_25,
        app_main_50: base_colours.app_main_50,
        app_main_100: base_colours.app_main_100,
        app_main_200: base_colours.app_main_200,
        app_main_300: base_colours.app_main_300,
        app_main_400: base_colours.app_main_400,
        app_main_500: base_colours.app_main_500,
        app_main_600: base_colours.app_main_600,
        app_main_700: base_colours.app_main_700,
        app_main_800: base_colours.app_main_800,
        app_main_900: base_colours.app_main_900,
        app_main_950: base_colours.app_main_950,
        app_secondary_25: base_colours.app_secondary_25,
        app_secondary_50: base_colours.app_secondary_50,
        app_secondary_100: base_colours.app_secondary_100,
        app_secondary_200: base_colours.app_secondary_200,
        app_secondary_300: base_colours.app_secondary_300,
        app_secondary_400: base_colours.app_secondary_400,
        app_secondary_500: base_colours.app_secondary_500,
        app_secondary_600: base_colours.app_secondary_600,
        app_secondary_700: base_colours.app_secondary_700,
        app_secondary_800: base_colours.app_secondary_800,
        app_secondary_900: base_colours.app_secondary_900,
        app_secondary_950: base_colours.app_secondary_950,
        app_root: base_colours.app_root,
        app_white: base_colours.app_white,
        app_black: base_colours.app_black,
      },
      screens: {
        "3xl": "2160px",
      },
    },
  },
  plugins: [
    require("tw-elements/plugin.cjs"),
    require("@tailwindcss/forms"),
    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class="phx-click-loading:animate-ping">
    //
    plugin(({ addVariant }) =>
      addVariant("phx-no-feedback", [".phx-no-feedback&", ".phx-no-feedback &"])
    ),
    plugin(({ addVariant }) =>
      addVariant("phx-click-loading", [
        ".phx-click-loading&",
        ".phx-click-loading &",
      ])
    ),
    plugin(({ addVariant }) =>
      addVariant("phx-submit-loading", [
        ".phx-submit-loading&",
        ".phx-submit-loading &",
      ])
    ),
    plugin(({ addVariant }) =>
      addVariant("phx-change-loading", [
        ".phx-change-loading&",
        ".phx-change-loading &",
      ])
    ),

    // Embeds Heroicons (https://heroicons.com) into your app.css bundle
    // See your `CoreComponents.icon/1` for more information.
    //
    plugin(function ({ matchComponents, theme }) {
      let iconsDir = path.join(__dirname, "./vendor/heroicons/optimized");
      let values = {};
      let icons = [
        ["", "/24/outline"],
        ["-solid", "/24/solid"],
        ["-mini", "/20/solid"],
      ];
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).map((file) => {
          let name = path.basename(file, ".svg") + suffix;
          values[name] = { name, fullPath: path.join(iconsDir, dir, file) };
        });
      });
      matchComponents(
        {
          hero: ({ name, fullPath }) => {
            let content = fs
              .readFileSync(fullPath)
              .toString()
              .replace(/\r?\n|\r/g, "");
            return {
              [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
              "-webkit-mask": `var(--hero-${name})`,
              mask: `var(--hero-${name})`,
              "mask-repeat": "no-repeat",
              "background-color": "currentColor",
              "vertical-align": "middle",
              display: "inline-block",
              width: theme("spacing.5"),
              height: theme("spacing.5"),
            };
          },
        },
        { values }
      );
    }),
  ],
};
