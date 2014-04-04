module SettingsHelper
  def get_on_off(set)
    if set
      "On"
    else
      "Off"
    end
  end

  def turn_on_off(set)
    if set
      "Turn Off"
    else
      "Turn On"
    end
  end

  def get_button(set)
    if set
      'btn btn-danger'
    else
      'btn btn-success'
    end
  end
end
