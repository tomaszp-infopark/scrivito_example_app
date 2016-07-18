class BlogPostPage < Page

  attribute :abstract, :html
  attribute :author_email, :string
  attribute :author_name, :string
  attribute :image, :reference
  attribute :published_at, :date

  default_for(:published_at) do
    Time.zone.now
  end

  def valid_widget_classes_for(field_name)
    self.class.content_widgets
  end

  def feed_content
    body.map do |widget|
      widget.feed_content rescue nil
    end.compact.join(" ")
  end

  def text_extract
    abstract.present? ? abstract : super
  end

  def self.info_text_for_thumbnail
    "A single blog post."
  end

end
