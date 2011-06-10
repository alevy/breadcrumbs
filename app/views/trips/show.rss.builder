xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Amit's Travel Blog - #{@trip.title}"
    xml.description "a trail of breadcrumbs"
    xml.link posts_url(:format => :rss)

    for post in @trip.posts.limit(10)
      xml.item do
        xml.title post.title
        xml.description(raw Maruku.new(post.body).to_html)
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end

