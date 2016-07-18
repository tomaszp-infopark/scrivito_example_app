class SectionWidget < Widget

  attribute :bg_color, :enum, values: bg_colors, default: bg_colors.first
  attribute :bg_image, :reference
  attribute :content, :widgetlist
  attribute :padding_size, :enum, values: sizes, default: sizes.first

  def text_extract
    content.map(&:text_extract)
  end

  def self.info_text_for_thumbnail
    "A container for a content section, can have a background color or image."
  end

end
