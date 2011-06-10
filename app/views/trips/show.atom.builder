atom_feed do |feed|
  feed.title("Amit's Travel Blog - #{@trip.title}")
  feed.updated(@trip.posts.first.updated_at)
 
  for post in @trip.posts.limit(10)
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(raw(Maruku.new(post.body).to_html), :type => 'html')
      entry.updated(post.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) # needed to work with Google Reader.
      entry.author do |author|
        author.name("Amit Levy")
      end
    end
  end
end
