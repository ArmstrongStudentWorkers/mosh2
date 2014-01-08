module MoshModules
  module AdminModule

    def admin_filter
      unless user_signed_in? && current_user.admin?
        render file: "#{Rails.root}/public/404.html", status: 404, layout: false
      end
    end

  end
end
