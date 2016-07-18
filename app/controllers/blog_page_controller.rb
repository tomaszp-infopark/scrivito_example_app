class BlogPageController < CmsController

  def index
    page_size = 3
    @page = params[:page].to_i
    @tag = params[:tag]
    posts = recent_posts({
      limit: page_size + 1,
      offset: (page_size * @page),
      tag: @tag,
    })
    @posts = posts.take(page_size)
    @has_older_page = posts.size > page_size
    @has_newer_page = @page > 0

    @photo_stream = recent_posts(limit: 5)

    respond_to do |format|
      format.html
      format.atom
    end
  end

end
