class BlogPagesCreator < BaseSeedContentCreator

  def create
    puts("creating blog pages")
    blog_page = BlogPage.create({
      _path: "/blog",
      _permalink: "blog",
      title: "Blog",
      body: [
        SectionWidget.new({
          content: [
            create_h3("Blog"),
          ]
        }),
      ],
    })
    [
      {
        title: "Scrivito lets you reuse previously published content",
        author: OpenStruct.new(name: "Phil O. Sophos", email: "philosophos@example.com"),
        tags: %w[scrivito content managment system],
      },
      {
        title: "A cloud CMS at last – CDN included",
        author: OpenStruct.new(name: "James Writer", email: "jameswriter@example.com"),
        tags: %w[scrivito content managment cloud],
      },
      {
        title: "Asset management made easy",
        author: OpenStruct.new(name: "Clara Authorissa", email: "clara@example.com"),
        tags: %w[scrivito cloud software],
      },
      {
        title: "Your changes are saved automatically",
        author: OpenStruct.new(name: "Johny D. Author", email: "jda@example.com"),
        tags: %w[widgets management software],
      },
      {
        title: "Content management for Ruby on Rails apps",
        author: OpenStruct.new(name: "Phil O. Sophos", email: "philosophos@example.com"),
        tags: %w[scrivito widgets],
      },
      {
        title: "Your clients will love Scrivito for its ease of use",
        author: OpenStruct.new(name: "Johny D. Author", email: "jda@example.com"),
        tags: %w[client server widgets content],
      },
      {
        title: "Working copies of your content are like branches in Git",
        author: OpenStruct.new(name: "Phil O. Sophos", email: "philosophos@example.com"),
        tags: %w[cloud software service],
      },
      {
        title: "Edit content in place, directly on your pages",
        author: OpenStruct.new(name: "James Writer", email: "jameswriter@example.com"),
        tags: %w[scrivito demo],
      },
      {
        title: "Widgets are the building blocks of your web pages",
        author: OpenStruct.new(name: "James Writer", email: "jameswriter@example.com"),
        tags: %w[scrivito demo cloud],
      },
      {
        title: "Scrivito makes editing content fun again",
        author: OpenStruct.new(name: "Johny D. Author", email: "jda@example.com"),
        tags: %w[scrivito sample system],
      },
    ].each_with_index do |config, index|
      create_blog_post(OpenStruct.new({
        i: index + 1,
        image: seed_creator.sample_image(index + 1),
        published_at: ((10 - index)^2).days.ago,
      }.merge(config)))
    end
    blog_page
  end

  def create_blog_post(blog_post_config)
    puts("creating blog page #{blog_post_config.i}")
    BlogPostPage.create({
      title: blog_post_config.title,
      author_email: blog_post_config.author.email,
      author_name: blog_post_config.author.name,
      image: blog_post_config.image,
      published_at: blog_post_config.published_at,
      tags: blog_post_config.tags,
      body: [
        create_text(
            "<p>This blog was implemented using two CMS object classes, BlogPage for the overview "\
            "page, and BlogPostPage for individual blogposts. On the overview page, up to three of the "\
            "most recently published posts are rendered, latest first. The titles of these posts are "\
            "linked to the corresponding full versions, the BlogPostPages, and the content of each post "\
            "fades out after a couple of lines.</p>"\
            "<p>The BlogPostPage class is equipped with various attributes typically required for "\
            "blog posts, e.g. a title, tags, banner image, body.</p>"\
            "<p>The overview page as well as the individual blog post pages feature a side bar "\
            "containing a tag list (ordered by frequency) and an RSS feed link. "\
            "Additionally, there's a photo stream on the side bar showing a couple of images taken from the "\
            "latest blog posts.</p>"\
            "<p>Scrivito supports tagging as well as faceted searches, which makes it easy "\
            "to maintain tag lists and create tag clouds where each tag is linked to the "\
            "corresponding subset of CMS objects.</p>"),
        create_text(
            "<h2>Creating and editing posts</h2>"\
            "<p>First, make sure that you are using the demo as an editor and that you're in editing mode. "\
            "To create a blog post, open the page menu on the right hand side of the Scrivito panel "\
            "and select &quot;Create&nbsp;page&quot;. From the page type browser that shows up, select "\
            "BlogPostPage. You should now see an empty blog post.</p>"\
            "<p>All parts of a blog post except the tags can be edited in place, even on the "\
            "overview page. Some elements don't show a widget frame as your mouse pointer hovers "\
            "over them (the banner image, the headline, and the metadata underneath the headline). "\
            "These elements haven't been included as widgets, however, you can still alter their contents: "\
            "Click the banner image to upload or select a different one via the Content Browser, or highlight text "\
            "(e.g. the author name) to edit it.</p>"\
            "<p>For editing the tags, a feature-rich editor is available on the "\
            "&quot;Page&nbsp;properties&quot; dialog of the blog post. "\
            "The body of each blog post is of course a widget list, so don't hesitate to use columns "\
            "or to enrich your posts with images, for example.</p>"),
      ],
    })
  end

end
