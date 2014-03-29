module PostersHelper
  def get_url(url)
    url.slice!(0)
    "#{root_url}#{url}"
  end

  def show_attachment_errors(poster)
    errors = ""
    if has_attachment_error(poster)
      poster.errors.messages[:attachment].each do |message|
        errors += message
      end
    end
    errors
  end

  def style_for_errors(poster)
    if has_attachment_error(poster)
      "error"
    end
  end

  private
  def has_attachment_error(poster)
    !poster.errors.messages[:attachment].empty?
  end
end
