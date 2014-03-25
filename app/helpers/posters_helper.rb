module PostersHelper
  def get_url(url)
    url.slice!(0)
    "#{root_url}#{url}"
  end
end
