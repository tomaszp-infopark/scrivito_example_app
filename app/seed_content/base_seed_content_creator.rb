class BaseSeedContentCreator

  def initialize(seed_creator:)
    @seed_creator = seed_creator
  end

  attr_reader :seed_creator

  private

  def create_image(image_obj)
    ImageWidget.new(image: image_obj, show_in_lightbox: "no")
  end

  def create_image_with_lightbox(image_obj)
    ImageWidget.new(image: image_obj, show_in_lightbox: "yes")
  end

  def create_columns(columns)
    case columns.size
    when 1
      ColumnWidget.new({
        column1: columns[0],
        column1_width: 12,
        column2_width: 0,
        column3_width: 0,
      })
    when 2
      ColumnWidget.new({
        column1: columns[0],
        column2: columns[1],
        column1_width: 6,
        column2_width: 6,
        column3_width: 0,
      })
    when 3
      ColumnWidget.new({
        column1: columns[0],
        column2: columns[1],
        column3: columns[2],
        column1_width: 4,
        column2_width: 4,
        column3_width: 4,
      })
    when 4
      ColumnWidget.new({
        column1: columns[0],
        column2: columns[1],
        column3: columns[2],
        column4: columns[3],
        column1_width: 3,
        column2_width: 3,
        column3_width: 3,
        column4_width: 3,
      })
    when 5
      ColumnWidget.new({
        column1: columns[0],
        column2: columns[1],
        column3: columns[2],
        column4: columns[3],
        column5: columns[4],
        column1_width: 2,
        column2_width: 3,
        column3_width: 2,
        column4_width: 3,
        column5_width: 2,
      })
    when 6
      ColumnWidget.new({
        column1: columns[0],
        column2: columns[1],
        column3: columns[2],
        column4: columns[3],
        column5: columns[4],
        column6: columns[5],
        column1_width: 2,
        column2_width: 2,
        column3_width: 2,
        column4_width: 2,
        column5_width: 2,
        column6_width: 2,
      })
    else
      raise "unsupported number of columns #{columns.size}"
    end
  end

  def create_h1(headline)
    HeadlineWidget.new(tag: "h1", headline: headline)
  end

  def create_h1_center(headline)
    HeadlineWidget.new(tag: "h1", headline: headline, alignment: "center")
  end

  def create_h2(headline)
    HeadlineWidget.new(tag: "h2", headline: headline)
  end

  def create_h2_center(headline)
    HeadlineWidget.new(tag: "h2", headline: headline, alignment: "center")
  end

  def create_h3(headline)
    HeadlineWidget.new(tag: "h3", headline: headline)
  end

  def create_h3_center(headline)
    HeadlineWidget.new(tag: "h3", headline: headline, alignment: "center")
  end

  def create_h3_right(headline)
    HeadlineWidget.new(tag: "h3", headline: headline, alignment: "right")
  end

  def create_h4(headline)
    HeadlineWidget.new(tag: "h4", headline: headline)
  end

  def create_h4_center(headline)
    HeadlineWidget.new(tag: "h4", headline: headline, alignment: "center")
  end

  def create_h5(headline)
    HeadlineWidget.new(tag: "h5", headline: headline)
  end

  def create_h5_center(headline)
    HeadlineWidget.new(tag: "h5", headline: headline, alignment: "center")
  end

  def create_text(text)
    TextWidget.new(text: text)
  end

  def create_text_center(text)
    TextWidget.new(text: text, alignment: "center")
  end

  def create_text_right(text)
    TextWidget.new(text: text, alignment: "right")
  end

  def create_large_space
    SpaceWidget.new(size: "large")
  end

  def create_large_button(style, text, action_reference=nil)
    create_button("large", style, text, action_reference)
  end

  def create_large_button_right(style, text, action_reference=nil)
    create_button_right("large", style, text, action_reference)
  end

  def create_button(size, style, text, action_reference=nil)
    CallToActionWidget.new({
      button_style: style,
      size: size,
      action_link: Scrivito::Link.new(obj: action_reference, title: text)
    })
  end

  def create_button_center(size, style, text)
    CallToActionWidget.new({
      alignment: "center",
      button_style: style,
      size: size,
      action_link: Scrivito::Link.new(url: "#", title: text)
    })
  end

  def create_button_right(size, style, text, action_reference=nil)
    CallToActionWidget.new({
      alignment: "right",
      button_style: style,
      size: size,
      action_link: Scrivito::Link.new(obj: action_reference, title: text)
    })
  end

end
