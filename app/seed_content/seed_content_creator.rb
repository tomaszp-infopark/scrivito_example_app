class SeedContentCreator < BaseSeedContentCreator

  def self.create
    workspace = Scrivito::Workspace.create(title: "Example #{SecureRandom.hex(6)}")
    Scrivito::Workspace.current = workspace
    new(seed_creator: nil).create
    workspace.publish
    find_or_create_workspace("Working copy 1")
  end

  def self.find_or_create_workspace(workspace_title)
    Scrivito::Workspace.find_by_title(workspace_title) ||
        Scrivito::Workspace.create(title: workspace_title)
  end

  def create
    Obj.all.each do |obj|
      puts("clearing path #{obj.path}")
      obj.update(_path: nil)
    end
    Obj.all.each do |obj|
      puts("destroying #{obj.id}")
      obj.destroy
    end
    home_page
    search_page
  end

  def home_page
    @home_page ||= HomePageCreator.new({
      seed_creator: self,
      child_order: [
        blog_overview_page,
        hierarchy_start_page,
        features_start_page,
      ],
    }).create
  end

  def blog_overview_page
    @blog_overview_page ||= BlogPagesCreator.new(seed_creator: self).create
  end

  def hierarchy_start_page
    @hierarchy_start_page ||= HierarchyPagesCreator.new(seed_creator: self).create
  end

  def features_start_page
    @features_start_page ||= FeaturesPagesCreator.new(seed_creator: self).create
  end

  def gallery_page
    @gallery_page ||= GalleryPageCreator.new(seed_creator: self).create
  end

  def contact_page
    @contact_page ||= ContactPageCreator.new(seed_creator: self).create
  end

  def pricing_page
    @pricing_page ||= PricingPageCreator.new(seed_creator: self).create
  end

  def search_page
    @search_page ||= SearchPageCreator.new(seed_creator: self).create
  end

  def sample_image(i)
    @images ||= [
      upload_image_obj("teaser-1.jpg", "Sunset"),
      upload_image_obj("teaser-2.jpg", "City 1"),
      upload_image_obj("teaser-3.jpg", "Sun"),
      upload_image_obj("teaser-4.jpg", "Football"),
      upload_image_obj("teaser-5.jpg", "Yellow"),
      upload_image_obj("teaser-6.jpg", "Orange Blue"),
      upload_image_obj("teaser-7.jpg", "City 2"),
      upload_image_obj("teaser-8.jpg", "Beach Night"),
      upload_image_obj("teaser-9.jpg", "Boats"),
      upload_image_obj("teaser-10.jpg", "Street"),
      upload_image_obj("aqua.jpg", "Aqua"),
      upload_image_obj("city-skyline.jpg", "City Skyline"),
      upload_image_obj("mountain-lake.jpg", "Mountain Lake"),
      upload_image_obj("red-gerbera.jpg", "Red Gerbera"),
    ]
    @images[(i - 1) % 14]
  end

  private

  def upload_image_obj(name, title)
    puts("creating image #{name}")
    Image.create({
      _permalink: name,
      blob: File.new(Rails.root.join("scrivito_content/#{name}")),
      title: title,
    })
  end

end
