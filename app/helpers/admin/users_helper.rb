module Admin::UsersHelper

  def get_check(bool)
    if bool
      tag 'i', class: 'fa fa-check-square-o'
    else
      tag 'i', class: 'fa fa-square-o'
    end
  end
end
