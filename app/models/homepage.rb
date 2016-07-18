class Homepage < Page

  attribute :contact_us_text, :html
  attribute :footer_links, :linklist

  def self.info_text_for_thumbnail
    "Home page."
  end

end
