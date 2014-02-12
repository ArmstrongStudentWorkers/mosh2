module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "MOSH: The McCarthy Online Support Hub"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def get_status(status)
    if status == "Pending"
      "<span class='label label-warning'>#{status}</span>".html_safe
    elsif status == "Finished"
      "<span class='label label-success'>#{status}</span>".html_safe
    elsif status == "Denied"
      "<span class='label label-important'>#{status}</span>".html_safe
    else
      ""
    end
  end


  def active_page?(page, current_step)
    'active' if page == current_step
  end
end
