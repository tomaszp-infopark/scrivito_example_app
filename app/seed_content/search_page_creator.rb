class SearchPageCreator < BaseSeedContentCreator

  def create
    puts("creating search page")
    SearchPage.create({
      _permalink: "search",
      title: "Search Results"
    })
  end

end
