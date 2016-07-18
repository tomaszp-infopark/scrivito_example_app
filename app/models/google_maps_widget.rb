class GoogleMapsWidget < Widget

  attribute :address, :string
  attribute :height, :string, default: "100"

  def text_extract
    address
  end

  def self.info_text_for_thumbnail
    "Show a map that displays a pin for a given address."
  end

end
