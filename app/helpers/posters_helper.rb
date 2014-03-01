module PostersHelper
  def google_docs_url(url)
    url.slice!(0)
    "https://docs.google.com/gview?url=#{root_url}#{url}&embedded=true"
  end

  def get_url(url)
    url.slice!(0)
    "#{root_url}#{url}"
  end
end
