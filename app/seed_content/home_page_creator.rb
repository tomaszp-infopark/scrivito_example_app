class HomePageCreator < BaseSeedContentCreator

  def initialize(child_order:, seed_creator:)
    super(seed_creator: seed_creator)
    @child_order = child_order
  end

  attr_reader :child_order

  def create
    puts("creating home page")
    Homepage.create({
      _path: "/",
      title: "Welcome to the Scrivito example app!",
      child_order: child_order,
      footer_links: [
        Scrivito::Link.new({
          title: "Guides and tutorials",
          url: "https://scrivito.com/documentation",
        }),
        Scrivito::Link.new({
          title: "Create a widget!",
          url: "https://scrivito.com/page-and-widget-views-explained-c70fa4323bed3790",
        }),
        Scrivito::Link.new({
          title: "Widget gallery",
          url: "https://scrivito.com/widget-gallery",
        }),
      ],
      contact_us_text: "<p>"\
          "25, Lorem Ipsum St, Orange <br />"\
          "California, US <br />"\
          "Phone: +1 800 123 3456 <br />"\
          "Fax: +1 800 123 3456 <br />"\
          "Email: <a href=\"mailto:info@anybiz.com\">info@anybiz.com</a>",
      body: [
        SectionWidget.new({
          bg_color: "light",
          padding_size: "small",
          content: [
            create_columns([
              [
                create_text(
                    "<h3>1. Become a Scrivito editor!</h3>"\
                    "<p>Click &quot;View as Scrivito editor&quot; on the top "\
                    "navigation, then activate the Edit mode on the Scrivito panel!</p>"\
                    "<p><b>Click this text to change it.</b></p>"\
                    "<p>If you delete something and want it back, "\
                    "simply create a fresh working copy from the "\
                    "published content.</p>"),
              ],
              [
                create_text(
                    "<h3>2. Publish your changes!</h3>"\
                    "<p>If you want to see your changes as a regular "\
                    "website visitor, publish your working copy and "\
                    "ensure that the website visitor view is active.</p>"),
              ],
              [
                create_image(seed_creator.sample_image(9)),
                create_text(
                    "<p><b>Click the image</b> to exchange it or "\
                    "<b>drag one from your desktop</b> onto it.</p>"),
              ],
            ]),
          ],
        }),
      ],
    })
  end

end
