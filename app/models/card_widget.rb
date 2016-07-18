class CardWidget < Widget

  attribute :bg_color, :enum, values: bg_colors, default: bg_colors.first
  attribute :bg_image, :reference
  attribute :color, :enum, values: colors, default: colors.first
  attribute :content, :widgetlist
  attribute :show_heading, :enum, values: %w[yes no], default: "yes"
  attribute :title, :string

  def show_heading?
    show_heading != "no"
  end

  def text_extract
    [title] + content.map(&:text_extract)
  end

  def self.info_text_for_thumbnail
    "Card with selectable color, background, title bar, tagline, and shadow."
  end

end
