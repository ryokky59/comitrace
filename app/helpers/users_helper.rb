module UsersHelper
    def user_icon(user)
      if user.icon.present?
        link_to image_tag(user.icon), user_path(id: user.id)
      else
        link_to image_tag(asset_path("usericon.png")), user_path(id: user.id)
      end
    end
end
