class Page < Obj

  attribute :body, :widgetlist
  attribute :child_order, :referencelist
  attribute :display_breadcrumb_and_title, :enum, values: %w[yes no], default: "no"
  attribute :tags, :stringlist
  attribute :title, :string

  def display_breadcrumb_and_title?
    !(display_breadcrumb_and_title == "no")
  end

  def text_extract
    body.map(&:text_extract).flatten.join(" ... ") rescue ""
  end

  def self.info_text_for_thumbnail
    "A regular content page consisting of widgets."
  end

end
