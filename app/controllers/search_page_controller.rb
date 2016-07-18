class SearchPageController < CmsController

  HITS_PER_PAGE = 5

  def index
    @page = ["#{params[:page]}".to_i, 0].max
    @q = "#{params[:q]}"
    @tag = "#{params[:tag]}"
    if @q.blank? && @tag.blank?
      search_query = []
    else
      search_query = Obj.all
      if @q.present?
        search_query = search_query.and(:*, :contains_prefix, @q)
      end
      if @tag.present?
        search_query = search_query.and(:tags, :equals, @tag)
      end
      search_query = search_query.batch_size(HITS_PER_PAGE).offset(@page * HITS_PER_PAGE)
    end
    @total = search_query.size
    @hits = search_query.take(HITS_PER_PAGE)
    @last_page = ((@total - 1) / HITS_PER_PAGE.to_f).floor
  end

  private

  def search_path(tag: nil, page: nil, q: nil)
    scrivito_path(@obj, page: page, q: q || @q, tag: tag || @tag)
  end
  helper_method(:search_path)

end
