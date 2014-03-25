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

  def show_status(status)
    if status == "Pending"
      "<span class='label label-warning'>#{status}</span>".html_safe
    elsif status == "Finished"
      "<span class='label label-success'>#{status}</span>".html_safe
    elsif status == "Denied"
      "<span class='label label-important'>#{status}</span>".html_safe
    elsif status == "Active"
      "<span class='label label-success'>#{status}</span>".html_safe
    elsif status == "Defective"
      "<span class='label label-inverse'>#{status}</span>".html_safe
    elsif status == "Overstock"
      "<span class='label label-info'>#{status}</span".html_safe
    elsif status == "Surplus - In Waiting"
      "<span class='label label-warning'>#{status}</span>".html_safe
    elsif status == "Surplus - Shipped"
      "<span class='label label-default'>#{status}</span>".html_safe
    elsif status == "Accepted"
      "<span class='label label-success'>#{status}</span>".html_safe
    else
      ""
    end
  end

  def format_date(datetime)
    datetime.strftime('%m/%d/%Y')
  end

  def active_page?(page, current_step)
    'active' if page == current_step
  end

  def get_check(bool)
    if bool
      tag 'i', class: 'fa fa-check-square-o'
    else
      tag 'i', class: 'fa fa-square-o'
    end
  end
end
