class HeadlineWidget < Widget

  attribute :alignment, :enum, values: alignments, default: alignments.first
  attribute :anchor, :string
  attribute :headline, :string
  attribute :tag, :enum, values: %w[h1 h2 h3 h4 h5 h6], default: "h3"

  def text_extract
    headline
  end

  def self.info_text_for_thumbnail
    "Display a heading in various sizes and alignments, allows to set an anchor."
  end

end
