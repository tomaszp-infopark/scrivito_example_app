class BlogPostPageController < CmsController

  def index
    @tag = params[:tag]
    @previous_post = previous_post(blog_post_page: @obj, tag: @tag)
    @next_post = next_post(blog_post_page: @obj, tag: @tag)
    @photo_stream = recent_posts(limit: 5)
    @recent_posts = @photo_stream.take(3)
  end

end
