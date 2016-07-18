atom_feed(language: 'en-US') do |feed|
  feed.title(@obj.title)
  feed.updated(@posts.first.try(:published_at))

  @posts.each do |post|
    feed.entry(post, url: scrivito_url(post)) do |entry|
      entry.title(post.title)
      entry.updated(post.published_at.strftime('%Y-%m-%dT%H:%M:%SZ'))
      entry.author do |author|
        author.name(post.author_name)
      end
      entry.content(truncate(strip_tags(post.feed_content), escape: false, length: 150), type: 'text')
    end
  end
end
