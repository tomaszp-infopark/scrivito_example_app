class ContactPageCreator < BaseSeedContentCreator

  def create
    puts("creating contact page")
    Page.create({
      _path: "/features/contact",
      title: "Sample Contact Page",
      tags: %w[section-widget maps-widget card-widget column-widget],
      body: [
        SectionWidget.new({
          bg_image: seed_creator.sample_image(12),
          padding_size: "medium",
          content: [
            create_h1_center("Get in touch."),
            SpaceWidget.new({
              size: "medium",
            }),
            create_columns([
              [
                CardWidget.new({
                  bg_color: "none",
                  color: "default",
                  show_heading: "no",
                  title: "Startup Inc.",
                  content: [
                    create_h3("Startup Inc."),
                    GoogleMapsWidget.new({
                      address: "350 5th Avenue, New York, NY 10118, United States",
                      height: "150",
                    }),
                    create_text(
                        "<p>350 5th Avenue<br>"\
                        "20th Floor<br>"\
                        "New York, NY 10118<br>"\
                        "United States</p>"\
                        "<p>+1 212 555 5555</p>"),
                  ],
                }),
              ],
              [
                CardWidget.new({
                  bg_color: "none",
                  color: "default",
                  show_heading: "no",
                  title: "Startup London",
                  content: [
                    create_h3("Startup London"),
                    GoogleMapsWidget.new({
                      address: "32 London Bridge Street, London SE1 9SG, United Kingdom",
                      height: "150",
                    }),
                    create_text(
                        "<p>32 London Bridge Street<br>"\
                        "London<br>"\
                        "SE1 9SG<br>"\
                        "United Kingdom</p>"\
                        "<p>+44 (0)207 555 555</p>"),
                  ],
                }),
              ],
              [
                CardWidget.new({
                  bg_color: "none",
                  color: "default",
                  show_heading: "no",
                  title: "Startup Berlin",
                  content: [
                    create_h3("Startup Berlin"),
                    GoogleMapsWidget.new({
                      address: "Platz der Republik 1, 11011 Berlin, Germany",
                      height: "150",
                    }),
                    create_text(
                      "<p>Platz der Republik 1<br>"\
                      "Berlin<br>"\
                      "11011<br>"\
                      "Germany</p>"\
                      "<p>+49 30 55 55 55</p>"),
                  ],
                }),
              ],
            ]),
          ],
        }),
      ],
    })
  end

end
