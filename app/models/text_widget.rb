class TextWidget < Widget

  attribute :alignment, :enum, values: alignments, default: alignments.first
  attribute :text, :html

  def text_extract
    ActionController::Base.helpers.strip_tags(text)
  end

  def self.info_text_for_thumbnail
    "Display text and HTML content."
  end

end
