class SpaceWidget < Widget

  attribute :size, :enum, values: sizes, default: sizes.second

  def self.info_text_for_thumbnail
    "Creates a vertical space."
  end

end
