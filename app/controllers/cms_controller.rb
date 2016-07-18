class CmsController < ApplicationController

  include Scrivito::ControllerActions

  private

  def home_page
    @home_page ||= Homepage.all.first
  end
  helper_method :home_page

  def blog_page
    @blog_page ||= BlogPage.all.first
  end
  helper_method :blog_page

  def search_page
    @search_page ||= SearchPage.all.first
  end
  helper_method :search_page

  def tag_facets
    Obj.all.facet("tags", limit: 50)
  end
  helper_method :tag_facets

  def tag_facets_for_blog
    Obj.where(:_obj_class, :equals, BlogPostPage).facet("tags", limit: 50)
  end
  helper_method :tag_facets_for_blog

  def recent_posts(limit: 3, offset: 0, tag: nil)
    posts(tag: tag).
        order(published_at: :desc).
        offset(offset).
        batch_size(limit).take(limit)
  end
  helper_method :recent_posts

  def next_post(blog_post_page:, tag: nil)
    posts(tag: tag).
        and(:published_at, :is_greater_than, blog_post_page.published_at).
        order(:published_at).
        batch_size(1).take(1).first
  end

  def previous_post(blog_post_page:, tag: nil)
    posts(tag: tag).
        and(:published_at, :is_less_than, blog_post_page.published_at).
        order(published_at: :desc).
        batch_size(1).take(1).first
  end

  def posts(tag: nil)
    query = Obj.where(:_obj_class, :equals, BlogPostPage)
    query = query.and(:tags, :equals, tag) if tag.present?
    query
  end

end
