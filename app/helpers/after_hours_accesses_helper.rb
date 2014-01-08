module AfterHoursAccessesHelper
  def show_sid(sid)
    if current_user.admin
      sid
    else
      "*********"
    end
  end
end
