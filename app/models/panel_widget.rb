class PanelWidget < Widget

  attribute :content, :widgetlist
  attribute :title, :string, default: "New Panel"

  def self.valid_container_classes
    [PanelGroupWidget]
  end

  def text_extract
    content.map(&:text_extract)
  end

  def self.info_text_for_thumbnail
    "Panel for display inside a panel group."
  end

end
