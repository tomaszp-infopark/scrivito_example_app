class FeaturesPagesCreator < BaseSeedContentCreator

  def create
    puts("creating features pages")
    Page.create({
      _path: "/features",
      title: "Sample Pages & Widgets",
      child_order: [
        create_section_page,
        create_columns_page,
        create_accordion_page,
        create_carousel_page,
        create_tab_groups_page,
        create_cards_page,
        create_call_to_action_page,
        create_maps_page,
        seed_creator.gallery_page,
        seed_creator.contact_page,
        seed_creator.pricing_page,
      ],
    })
  end

  def create_section_page
    puts("create section show case page")
    _create_feature_page({
      name: "section",
      tags: %w[section-widget column-widget],
      body: [
        SectionWidget.new({
          bg_color: "dark",
          bg_image: seed_creator.sample_image(13),
          padding_size: "medium",
          content: [create_h3("Section with background image and medium padding")],
        }),
        SectionWidget.new({
          bg_color: "light",
          padding_size: "small",
          content: [create_h3("Light section with small padding")],
        }),
        SectionWidget.new({
          bg_color: "white",
          padding_size: "medium",
          content: [create_h3("White section with medium padding")],
        }),
        SectionWidget.new({
          bg_color: "dark",
          bg_image: seed_creator.sample_image(11),
          padding_size: "large",
          content: [create_h3("Dark section with large padding")],
        }),
      ],
    })
  end

  def create_columns_page
    puts("create column show case page")
    _create_feature_page({
      name: "columns",
      tags: %w[column-widget],
      body: [
        _columns(1, "light", "white"),
        _columns(2, "dark", "white"),
        _columns(3, "light", "white"),
        _columns(4, "darker", "white"),
        _columns(5, "light", "white"),
        _columns(6, "dark", "white"),
      ],
    })
  end

  def _columns(column_count, bg_color, card_bg_color)
    SectionWidget.new({
      bg_color: bg_color,
      padding_size: "small",
      content: [
        create_h5(column_count == 1 ? "1 Column" : "#{column_count} Columns"),
        create_columns(1.upto(column_count).map do |i|
          [
            CardWidget.new({
              bg_color: card_bg_color,
              show_heading: "no",
              title: "Column #{i}/#{column_count}",
              content: [
                create_text("Column #{i}/#{column_count}"),
              ],
            }),
          ]
        end),
      ],
    })
  end

  def create_accordion_page
    puts("create accordion show case page")
    _create_feature_page({
      name: "accordion",
      tags: %w[panel-group-widget],
      body: [
        SectionWidget.new({
          bg_color: "white",
          bg_image: seed_creator.sample_image(12),
          padding_size: "small",
          content: [
            create_columns([
              [
                PanelGroupWidget.new({
                  layout_type: "accordion",
                  panels: [
                    _accordion_panel("First accordion group panel"),
                    _accordion_panel("Second accordion group panel"),
                    _accordion_panel("Third accordion group panel"),
                  ]
                })
              ],
              [
                PanelGroupWidget.new({
                  layout_type: "accordion",
                  panels: [
                    PanelWidget.new({
                      title: "Accordion inside accordion",
                      content: [
                        create_text("You can nest accordions."),
                        PanelGroupWidget.new({
                          layout_type: "accordion",
                          panels: [
                            _accordion_panel("First nested panel"),
                            _accordion_panel("Second nested panel"),
                            _accordion_panel("Third nested panel"),
                          ]
                        })
                      ],
                    }),
                    _accordion_panel("Second accordion group panel"),
                    _accordion_panel("Third accordion group panel"),
                  ]
                })
              ],
              [
                PanelGroupWidget.new({
                  layout_type: "accordion",
                  panels: [
                    PanelWidget.new({
                      title: "See more ...",
                      content: [
                        create_text(
                            "You can assign the Panel Group widget the "\
                            "&quot;accordion&quot; style in order to "\
                            "create content that is "\
                            "shown only after the visitor clicked the title."),
                        create_image(seed_creator.sample_image(9)),
                        create_text(
                            "The content of the &quot;see more&quot; section can be "\
                            "filled with anything you like."),
                      ],
                    }),
                  ]
                })
              ],
            ]),
          ],
        }),
      ],
    })
  end

  def _accordion_panel(title)
    PanelWidget.new({
      title: title,
      content: [
        create_text(
            "<p>Accordions can be created by using a Panel Group widget and "\
            "applying the <strong>accordion</strong> "\
            "style to it.</p>"),
      ]
    })
  end

  def create_carousel_page
    puts("create carousel widget show case page")
    _create_feature_page({
      name: "carousel",
      tags: %w[panel-group-widget],
      body: [
        SectionWidget.new({
          bg_color: "white",
          padding_size: "medium",
          content: [
            PanelGroupWidget.new({
              layout_type: "carousel",
              panels: 1.upto(6).to_a.map do |i|
                PanelWidget.new({
                  title: "Slide #{i}",
                  content: [
                    create_image(seed_creator.sample_image(i)),
                  ],
                })
              end,
            }),
          ],
        }),
      ],
    })
  end

  def create_tab_groups_page
    puts("create tab group widget show case page")
    _create_feature_page({
      name: "tab-groups",
      tags: %w[panel-group-widget],
      body: [
        SectionWidget.new({
          bg_color: "light",
          padding_size: "medium",
          content: [
            create_columns([
              [
                CardWidget.new({
                  bg_color: "white",
                  color: "default",
                  show_heading: "no",
                  title: "Panel group with nav pills on the left",
                  content: [
                    PanelGroupWidget.new({
                      layout_type: "tabs-left",
                      panels: [
                        _tab_group_panel("First", "panel with nav on the left"),
                        _tab_group_panel("Second", "panel with nav on the left"),
                        _tab_group_panel("Third", "panel with nav on the left"),
                      ],
                    }),
                  ],
                }),
              ],
              [
                CardWidget.new({
                  bg_color: "white",
                  color: "default",
                  show_heading: "no",
                  title: "Panel group with tabs on top",
                  content: [
                    PanelGroupWidget.new({
                      layout_type: "tabs-top",
                      panels: [
                        _tab_group_panel("First panel", "with tabs on top"),
                        _tab_group_panel("Second panel", "with tabs on top"),
                        _tab_group_panel("Third panel", "with tabs on top"),
                      ],
                    }),
                  ],
                }),
              ],
            ]),
          ],
        }),
      ],
    })
  end

  def _tab_group_panel(title, description)
    PanelWidget.new({
      title: title,
      content: [
        create_h5("#{title} #{description} content"),
        create_text(
            "<p>Tab groups can be created by using a Panel Group widget "\
            "and applying the "\
            "<strong>tabs-top</strong>, or "\
            "<strong>tabs-left</strong> style to it.</p>"\
            "<p>The <strong>tabs-top</strong> "\
            "style causes the navigation tabs to be shown at the top.</p>"\
            "<p>The <strong>tabs-left</strong> "\
            "style causes the navigation tabs to be shown on "\
            "the left side.</p>"),
      ]
    })
  end

  def create_cards_page
    puts("create card widget show case page")
    _create_feature_page({
      name: "cards",
      tags: %w[card-widget],
      body: [
        SectionWidget.new({
          bg_color: "light",
          padding_size: "medium",
          content: [
            create_columns(
              %w[default primary info].map do |c|
                [_card(color: c)]
              end
            ),
            create_columns(
              %w[success warning danger].map do |c|
                [_card(color: c)]
              end
            ),
            create_columns([
              [
                _card({
                  bg_color: "dark",
                  color: "default",
                  title: "Dark Background",
                }),
              ],
              [
                _card({
                  bg_color: "darker",
                  color: "default",
                  title: "Darker Background",
                }),
              ],
              [
                _card({
                  bg_color: "dark",
                  bg_image: seed_creator.sample_image(3),
                  color: "default",
                  title: "Background Image",
                }),
              ],
            ]),
            create_columns(
              (%w[white light dark darker].map {|c| [_bg_card(bg_color: c)]}),
            ),
            create_columns([
              seed_creator.sample_image(1),
              seed_creator.sample_image(2),
              seed_creator.sample_image(3),
              seed_creator.sample_image(4),
            ].map {|image_obj| [_bg_card(bg_color: "dark", bg_image: image_obj, title: "No Heading, Background Image")]}),
          ],
        })
      ],
    })
  end

  def _card(color: "default", bg_color: "white", bg_image: nil, title: nil)
    title ||= "#{color.humanize} Card"
    CardWidget.new({
      bg_color: bg_color,
      bg_image: bg_image,
      color: color,
      show_heading: "yes",
      title: title,
      content: [
        create_text(
            "<p>Try to change the background color of this card or hide "\
            "its title via "\
            "the &quot;Widget properties&quot; view. Click the handle in the upper right corner of "\
            "the widget to open its menu.</p>"),
      ],
    })
  end

  def _bg_card(bg_color: "none", bg_image: nil, title: nil)
    title ||= "No Heading, Background #{bg_color.upcase}"
    CardWidget.new({
      bg_color: bg_color,
      bg_image: bg_image,
      color: "default",
      show_heading: "no",
      title: title,
      content: [
        create_h5(title),
      ],
    })
  end

  def create_call_to_action_page
    puts("create call to action widget show case page")
    _create_feature_page({
      name: "call-to-action",
      tags: %w[call-to-action-widget],
      body: [
        SectionWidget.new({
          bg_color: "white",
          padding_size: "medium",
          content: [
            create_columns([
              [
                create_button_center("medium", "default", "Default action"),
                create_button_center("medium", "primary", "Primary action"),
                create_button_center("medium", "success", "Success action"),
                create_button_center("medium", "info",    "Info action"),
                create_button_center("medium", "warning", "Warning action"),
                create_button_center("medium", "danger",  "Danger action"),
              ],
              [
                create_button_center("large",  "link", "Large link action"),
                create_button_center("medium", "link", "Medium link action"),
                create_button_center("small",  "link", "Small link action"),
              ],
              [
                create_button_center("large",  "primary", "Large primary action"),
                create_button_center("medium", "primary", "Medium primary action"),
                create_button_center("small",  "primary", "Small primary action"),
              ],
            ]),
          ],
        }),
      ],
    })
  end

  def create_maps_page
    puts("create maps widget show case page")
    _create_feature_page({
      name: "maps",
      tags: %w[maps-widget],
      body: [
        SectionWidget.new({
          bg_color: "light",
          padding_size: "medium",
          content: [
            create_columns([
              [
                GoogleMapsWidget.new({
                  address: "32 London Bridge Street, London SE1 9SG, United Kingdom",
                  height: "200",
                }),
              ],
              [
                GoogleMapsWidget.new({
                  address: "Platz der Republik 1, 11011 Berlin, Germany",
                  height: "200",
                }),
              ],
            ]),
          ],
        }),
        SectionWidget.new({
          bg_color: "white",
          padding_size: "medium",
          content: [
            GoogleMapsWidget.new({
              address: "350 5th Avenue, New York, NY 10118, United States",
              height: "200",
            }),
          ]
        }),
      ],
    })
  end

  def _create_feature_page(name:, body:, tags:)
    Page.create({
      _path: "/features/#{name.underscore}",
      _permalink: name.dasherize,
      title: name.titleize,
      tags: tags,
      body: body,
    })
  end

end
