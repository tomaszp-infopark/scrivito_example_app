class GalleryPageCreator < BaseSeedContentCreator

  def create
    puts("creating gallery page")
    Page.create({
      _path: "/features/gallery",
      title: "Sample Gallery Page",
      tags: %w[section-widget card-widget column-widget],
      body: [
        SectionWidget.new({
          bg_color: "dark",
          padding_size: "small",
          content: [
            create_h2("Dark Three-Column Gallery with Cards"),
            create_columns([
              _panel_1("Gallery Item 1", seed_creator.sample_image(1)),
              _panel_1("Gallery Item 2", seed_creator.sample_image(2)),
              _panel_1("Gallery Item 3", seed_creator.sample_image(3)),
            ]),
          ],
        }),

        SectionWidget.new({
          bg_color: "darker",
          padding_size: "small",
          content: [
            create_h2_center("Darker Four-Column Gallery without Cards"),
            create_columns([
              _panel_2("Gallery Item 1", seed_creator.sample_image(4)),
              _panel_2("Gallery Item 2", seed_creator.sample_image(5)),
              _panel_2("Gallery Item 3", seed_creator.sample_image(6)),
              _panel_2("Gallery Item 4", seed_creator.sample_image(7)),
            ]),
          ],
        }),

        SectionWidget.new({
          bg_color: "light",
          content: [
            create_h2("Vertical Gallery with Alternating Background"),
          ],
        }),

        SectionWidget.new({
          bg_color: "white",
          content: [
            create_columns([
              [
                create_image(seed_creator.sample_image(8)),
              ],
              [
                create_h3("Gallery Item 1"),
                create_text(
                    "<p>This gallery item consists of a Column widget, an Image widget, "\
                    "a Headline, Text, and Call to Action widget.</p>"),
                create_large_button(
                    "danger", "Go to Contact Page", seed_creator.contact_page),
              ],
            ]),
          ],
        }),

        SectionWidget.new({
          bg_color: "light",
          content: [
            create_columns([
              [
                create_h3_right("Gallery Item 2"),
                create_text(
                    "<p>This gallery item consists of a Column widget, an Image widget, "\
                    "a Headline, Text, and Call to Action widget.</p>"),
                create_large_button_right(
                    "warning", "Go to Pricing Page", seed_creator.pricing_page),
              ],
              [
                create_image(seed_creator.sample_image(9)),
              ],
            ]),
          ],
        }),

        SectionWidget.new({
          bg_color: "white",
          content: [
            create_columns([
              [
                create_image(seed_creator.sample_image(10)),
              ],
              [
                create_h3("Gallery Item 3"),
                create_text(
                    "<p>This gallery item consists of a Column widget, an Image widget, "\
                    "a Headline, Text, and Call to Action widget.</p>"),
                create_large_button(
                    "primary", "Go to Pricing Page", seed_creator.pricing_page),
              ],
            ]),
          ],
        }),
      ],
    })
  end

  def _panel_1(title, image)
    [
      CardWidget.new({
        bg_color: "light",
        color: "default",
        show_heading: "yes",
        title: title,
        content: [
          create_image_with_lightbox(image),
          create_text(
              "This sample gallery consists of Column, Card, "\
              "Text, and Image widgets."),
        ],
      }),
    ]
  end

  def _panel_2(title, image)
    [
      create_h4_center(title),
      create_image_with_lightbox(image),
      create_text(
          "This sample gallery consists of Column, "\
          "Headline, Text, and Image widgets."),
    ]
  end

end
