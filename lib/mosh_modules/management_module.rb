module MoshModules
  module ManagementModule

    def management_filter
      unless user_signed_in? && (current_user.admin? || current_user.management?)
        render file: "#{Rails.root}/public/404.html", status: 404, layout: false
      end
    end

  end
end
