module GistsHelper
  def url_hash(url)
    url = url.split('/')
    url.last
  end
end
