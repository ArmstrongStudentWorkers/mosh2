module Admin::UsersHelper

  def get_admin(admin)
    if admin
      tag 'i', class: 'fa fa-check-square-o'
    else
      tag 'i', class: 'fa fa-square-o'
    end
  end

  def get_management(management)
    if management
      tag 'i', class: 'fa fa-check-square-o'
    else
      tag 'i', class: 'fa fa-square-o'
    end
  end

  def get_noncsit(noncsit)
    if noncsit
      tag 'i', class: 'fa fa-check-square-o'
    else
      tag 'i', class: 'fa fa-square-o'
    end
  end

end
